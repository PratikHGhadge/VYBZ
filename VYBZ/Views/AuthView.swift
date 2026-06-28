//
//  AuthView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 18/06/26.
//

import SwiftUI

struct AuthView: View {
	@ObservedObject var authViewModel: AuthViewModel

	var body: some View {

		ZStack {

			// MARK: Background

			AppBackground()

			VStack {

				Spacer()

				// MARK: Logo

				Image("VYBZlogo")
					.resizable()
					.scaledToFit()


				Text("VYBZ")
					.font(
						.system(
							size: 46,
							weight: .light
						)
					)
					.foregroundStyle(
						LinearGradient(
							colors: [
								.pink,
								.blue,
								.yellow
							],
							startPoint: .leading,
							endPoint: .trailing
						)
					)

				// MARK: Header

				Text(authViewModel.mode == .signIn ? "Welcome Back" : "Create Account")
					.font(.system(size: 38, weight: .bold))
					.foregroundStyle(.white)

				Text(
					authViewModel.mode == .signIn
					? "Sign in to continue your vibe"
					: "Join the vibe. Find your tribe."
				)
				.font(.title3)
				.foregroundStyle(.white.opacity(0.7))

				VStack(spacing: 18) {

					emailField

					passwordField
				}
				.padding(.top, 15)

				// MARK: Button

				Button {
					Task {
						await authViewModel.mode == .signIn ? authViewModel
							.signIn() : authViewModel
							.signUp()
					}
				} label: {
					Text(authViewModel.mode == .signIn ? "Sign In" : "Sign Up")
						.font(.title2.bold())
						.foregroundStyle(.white)
						.frame(maxWidth: .infinity)
						.frame(height: 62)
						.background(authViewModel.isFormValid ?
									LinearGradient(
										colors: [
											Color(red: 1.0, green: 0.35, blue: 0.65),
											Color(red: 0.25, green: 0.85, blue: 1.0)
										],
										startPoint: .leading,
										endPoint: .trailing
									) :
										LinearGradient(colors: [Color(.gray)],
													   startPoint: .leading,
													   endPoint: .trailing
													  )
						)
						.clipShape(
							RoundedRectangle(
								cornerRadius: 20
							)
						)
				}
				.disabled(!authViewModel.isFormValid)
				.opacity(authViewModel.isFormValid ? 1 : 0.5)
				.padding(.top, 24)

				// MARK: Divider

				HStack {
					Rectangle()
						.fill(.white.opacity(0.12))
						.frame(height: 1)

					Text("OR")
						.foregroundStyle(.white.opacity(0.5))
						.padding(.horizontal)

					Rectangle()
						.fill(.white.opacity(0.12))
						.frame(height: 1)
				}
				.padding(.vertical, 28)

				// MARK: Switch Mode

				HStack(spacing: 5) {
					Text(
						authViewModel.mode == .signIn
						? "Don't have an account?"
						: "Already have an account?"
					)
					.foregroundStyle(.white.opacity(0.7))

					Button {
						withAnimation(.easeInOut(duration: 0.3)) {
							authViewModel.mode = authViewModel.mode == .signIn ? .signUp : .signIn
						}
					} label: {
						Text(
							authViewModel.mode == .signIn
							? "Sign Up"
							: "Sign In"
						)
						.foregroundStyle(.pink)
						.fontWeight(.semibold)
					}
				}

				Spacer()

				bottomWave
			}
			.padding(.horizontal, 28)
		}
	}
}

// MARK: Components

extension AuthView {

	var emailField: some View {
		HStack(spacing: 14) {

			Image(systemName: "envelope")
				.foregroundStyle(.white.opacity(0.6))

			TextField(
				"Email",
				text: $authViewModel.email
			)
			.foregroundStyle(.white)
		}
		.padding()
		.frame(height: 65)
		.background(
			RoundedRectangle(cornerRadius: 18)
				.fill(Color.white.opacity(0.03))
		)
		.overlay {
			RoundedRectangle(cornerRadius: 18)
				.stroke(
					LinearGradient(
						colors: [
							.pink.opacity(0.5),
							.cyan.opacity(0.5)
						],
						startPoint: .leading,
						endPoint: .trailing
					),
					lineWidth: 1
				)
		}
	}

	var passwordField: some View {

		HStack(spacing: 14) {
			Image(systemName: "lock")
				.foregroundStyle(.white.opacity(0.6))

			Group {
				if authViewModel.showPassword {
					TextField(
						"Password",
						text: $authViewModel.password
					)
				} else {
					SecureField(
						"Password",
						text: $authViewModel.password
					)
				}
			}
			.foregroundStyle(.white)

			Button {
				authViewModel.showPassword.toggle()
			} label: {
				Image(
					systemName:
						authViewModel.showPassword
					? "eye.slash"
					: "eye"
				)
				.foregroundStyle(.white.opacity(0.6))
			}
		}
		.padding()
		.frame(height: 65)
		.background(
			RoundedRectangle(cornerRadius: 18)
				.fill(Color.white.opacity(0.03))
		)
		.overlay {

			RoundedRectangle(cornerRadius: 18)
				.stroke(
					LinearGradient(
						colors: [
							.pink.opacity(0.5),
							.cyan.opacity(0.5)
						],
						startPoint: .leading,
						endPoint: .trailing
					),
					lineWidth: 1
				)
		}
	}

	var bottomWave: some View {
		ZStack {
			Capsule()
				.fill(
					LinearGradient(
						colors: [
							.pink.opacity(0.8),
							.purple.opacity(0.8),
							.blue.opacity(0.8)
						],
						startPoint: .leading,
						endPoint: .trailing
					)
				)
				.frame(height: 8)
				.blur(radius: 20)

			Capsule()
				.fill(
					LinearGradient(
						colors: [
							.pink,
							.purple,
							.blue
						],
						startPoint: .leading,
						endPoint: .trailing
					)
				)
				.frame(height: 2)
				.blur(radius: 1)
		}
		.padding(.bottom, 20)
	}
}

#Preview {
	AuthView(authViewModel: AuthViewModel())
}

