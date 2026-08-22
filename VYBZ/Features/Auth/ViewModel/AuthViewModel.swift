//
//  AuthViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 23/06/26.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
	private var authStateListenerHandle: AuthStateDidChangeListenerHandle? = nil

	enum AuthMode {
		case signIn
		case signUp
	}

	@Published var email = ""
	@Published var userName = ""
	@Published var password = ""
	@Published var showPassword = false
	@Published var mode: AuthMode = .signIn
	@Published var isAuthenticated: Bool = false
	@Published var authUserData: UserData? = nil
	@Published var isLoading: Bool = false
	@Published var errorMessage: String? = nil {
		didSet {
			if let message = errorMessage {
				print("❌ [Auth Error Logged]: \(message)")
			} else {
				print("🧹 [Auth Error Logged]: Error state cleared (reset to nil).")
			}
		}
	}
	@Published var databaseUserProfile: DatabaseUserProfile? = nil


	init() {
		checkAuthentication()
	}

	var isFormValid: Bool {
		return !password.isEmpty && self.isValidEmail()
	}

	@MainActor
	func signUp() async {
		guard isFormValid else {
			self.errorMessage = "Please enter valid email and password"
			return
		}
		self.isLoading = true
		self.errorMessage = nil

		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			let user = result.user

			let userData = UserData(user: user)
			let db = Firestore.firestore()

//			let databaseUserProfile = DatabaseUserProfile(
//				joinedDate: Date(),
//				email: userData.email,
//				userID: userData.uID,
//				userName: userName
//			)
//
//			try db
//				.collection("users")
//				.document(user.uid)
//				.setData(from: databaseUserProfile, merge: false)

			self.isAuthenticated = true
			self.authUserData = userData
		} catch {
			self.errorMessage = error.localizedDescription
		}
		self.isLoading = false
	}

	func signIn() {
		guard isFormValid else {
			self.errorMessage = "Please enter valid email and password"
			return
		}

		DispatchQueue.main.async {
			self.isLoading = true
		}

		self.errorMessage = nil
		Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
			guard let self else { return }
			DispatchQueue.main.async {
				self.isLoading = false
				if let error = error {
					self.errorMessage = error.localizedDescription
				} else if let user = result?.user {
					self.isAuthenticated = true
					self.authUserData = UserData(user: user)
				}
			}
		}
	}

	func signOut() {
		do {
			try Auth.auth().signOut()
			DispatchQueue.main.async {
				self.isAuthenticated = false
				self.authUserData = nil
			}
		} catch {
			DispatchQueue.main.async {
				self.errorMessage = error.localizedDescription
			}
		}
	}

	func isValidEmail() -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
		return emailPredicate.evaluate(with: email)
	}

	func fetchUserData() async {
		guard let uid = Auth.auth().currentUser?.uid else { return }
		do {
//			let databaseUser = try await fetchDatabaseUserProfile(withUID: uid)
//			print("fetched user \(databaseUser)")
//			DispatchQueue.main.async {
//				self.databaseUserProfile = databaseUser
//			}
		} catch {
			self.errorMessage = error.localizedDescription
		}
	}

	// MARK: Private helpers

	private func checkAuthentication() {
		authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
			guard let self = self else { return }
			DispatchQueue.main.async {
				if let user = user {
					self.isAuthenticated = true
					self.authUserData = UserData(user: user)
				} else {
					self.isAuthenticated = false
					self.authUserData = nil
				}
			}
		}
	}

//	private func fetchDatabaseUserProfile(withUID uid: String) async throws -> DatabaseUserProfile {
//		let db = Firestore.firestore()
//		return try await db.collection("users").document(uid).getDocument(as: DatabaseUserProfile.self)
//	}

	deinit {
		if let handle = authStateListenerHandle {
			Auth.auth().removeStateDidChangeListener(handle)
		}
	}
}
