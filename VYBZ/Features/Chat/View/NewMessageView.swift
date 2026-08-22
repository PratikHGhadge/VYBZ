//
//  NewMessageView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 21/08/26.
//

import SwiftUI

struct NewMessageView: View {

	@Environment(\.dismiss) private var dismiss

	@State private var searchText = ""
	@State private var selectedUser: String?

	var body: some View {
		NavigationStack {
			ZStack {
				Color(
					red: 0.075,
					green: 0.065,
					blue: 0.065
				)
				.ignoresSafeArea()

				VStack(spacing: 0) {

					searchField

					ScrollView(
						.vertical,
						showsIndicators: false
					) {
						VStack(
							alignment: .leading,
							spacing: 20
						) {

							Text("Suggested")
								.font(
									.system(
										size: 15,
										weight: .medium
									)
								)
								.foregroundStyle(
									.white.opacity(0.50)
								)

							ForEach(NewMessageUser.mockUsers) { user in
								newMessageRow(user)
							}

							Text("Recent")
								.font(
									.system(
										size: 15,
										weight: .medium
									)
								)
								.foregroundStyle(
									.white.opacity(0.50)
								)
								.padding(.top, 12)

							Spacer(minLength: 100)
						}
						.padding(.horizontal, 24)
						.padding(.top, 22)
					}

					startChatButton
				}
			}
			.navigationTitle("New Message")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(
					placement: .topBarTrailing
				) {
					Button("Cancel") {
						dismiss()
					}
					.foregroundStyle(.white)
				}
			}
		}
		.preferredColorScheme(.dark)
	}

	private var searchField: some View {
		HStack(spacing: 10) {
			Text("To:")
				.foregroundStyle(
					.white.opacity(0.55)
				)

			TextField(
				"Search people...",
				text: $searchText
			)
			.foregroundStyle(.white)
			.tint(.pink)
		}
		.font(
			.system(
				size: 16,
				weight: .regular
			)
		)
		.padding(.horizontal, 18)
		.frame(height: 55)
		.background(
			Color.white.opacity(0.05)
		)
	}

	private func newMessageRow(
		_ user: NewMessageUser
	) -> some View {

		Button {
			withAnimation(.easeInOut(duration: 0.2)) {
				selectedUser = user.name
			}
		} label: {
			HStack(spacing: 14) {

				Image(user.avatar)
					.resizable()
					.scaledToFill()
					.frame(
						width: 48,
						height: 48
					)
					.clipShape(Circle())

				VStack(
					alignment: .leading,
					spacing: 3
				) {

					HStack(spacing: 5) {
						Text(user.name)
							.font(
								.system(
									size: 16,
									weight: .semibold
								)
							)

						if user.verified {
							Image(
								systemName:
									"checkmark.seal.fill"
							)
							.font(.system(size: 12))
						}
					}

					Text(user.username)
						.font(.system(size: 14))
						.foregroundStyle(
							.white.opacity(0.55)
						)
				}

				Spacer()

				ZStack {
					Circle()
						.stroke(
							Color.white.opacity(0.35),
							lineWidth: 1.5
						)

					if selectedUser == user.name {
						Circle()
							.fill(Color.pink)
							.padding(4)

						Image(systemName: "checkmark")
							.font(
								.system(
									size: 11,
									weight: .bold
								)
							)
							.foregroundStyle(.white)
					}
				}
				.frame(
					width: 25,
					height: 25
				)
			}
		}
		.foregroundStyle(.white)
	}

	private var startChatButton: some View {
		Button {
			// Start chat
		} label: {
			Text(
				selectedUser == nil
				? "Start Chat"
				: "Start Chat (1)"
			)
			.font(
				.system(
					size: 17,
					weight: .semibold
				)
			)
			.foregroundStyle(.white)
			.frame(maxWidth: .infinity)
			.frame(height: 58)
			.background(
				selectedUser == nil
				? Color.white.opacity(0.12)
				: Color.pink,
				in: RoundedRectangle(
					cornerRadius: 17,
					style: .continuous
				)
			)
		}
		.disabled(selectedUser == nil)
		.padding(.horizontal, 24)
		.padding(.top, 10)
		.padding(.bottom, 10)
	}
}

