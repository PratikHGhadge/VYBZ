//
//  AuthViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 23/06/26.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {

	enum AuthMode {
		case signIn
		case signUp
	}

	@Published var email = ""
	@Published var password = ""
	@Published var showPassword = false

	@Published var mode: AuthMode = .signIn

	func signUp() {
		// TODO: signUp Logic
	}

	func signIn() {
		// TODO: SignIn Logic
	}
}
