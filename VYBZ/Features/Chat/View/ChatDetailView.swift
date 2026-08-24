//
//  ChatDetailView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 22/08/26.
//

import SwiftUI

// MARK: - Chat Detail View

struct ChatDetailView: View {

	let user: ChatUser

	@Environment(\.dismiss) private var dismiss

	@State private var messageText = ""
	@State private var messages: [ChatMessage] = []
	@FocusState private var isMessageFieldFocused: Bool

	init(
		user: ChatUser = ChatUser(
			name: "Pratik ghadge",
			username: "@pratikghadge",
			avatar: "profile_cover",
			isVerified: true,
			isOnline: true
		)
	) {
		self.user = user

		_messages = State(
			initialValue: [
				ChatMessage(
					text: "Hey! 👋",
					time: "9:20 AM",
					type: .received
				),

				ChatMessage(
					text: "Hey Pratik! ❤️",
					time: "9:21 AM",
					type: .sent
				),

				ChatMessage(
					text: "How are you?",
					time: "9:22 AM",
					type: .received
				),

				ChatMessage(
					text: "I'm good! Just working on something new.",
					time: "9:22 AM",
					type: .sent
				),

				ChatMessage(
					text: "That's awesome! Can't wait to see it 🔥",
					time: "9:23 AM",
					type: .received
				),

				ChatMessage(
					text: nil,
					imageName: "chat_beach",
					time: "9:24 AM",
					type: .sent
				),

				ChatMessage(
					text: "Wow! That looks amazing 😍",
					time: "9:24 AM",
					type: .received
				)
			]
		)
	}

	var body: some View {
		ZStack {
			background

			VStack(spacing: 0) {

				chatHeader

				messageList

				messageComposer
			}
		}
		.ignoresSafeArea(.keyboard, edges: .bottom)
		.preferredColorScheme(.dark)
		.navigationBarBackButtonHidden(true)
	}
}


// MARK: - Background

private extension ChatDetailView {

	var background: some View {
		ZStack {
			Color(
				red: 0.025,
				green: 0.028,
				blue: 0.028
			)
			.ignoresSafeArea()

			// Subtle warm glow
			Circle()
				.fill(
					Color(
						red: 0.35,
						green: 0.12,
						blue: 0.12
					)
					.opacity(0.16)
				)
				.frame(
					width: 350,
					height: 350
				)
				.blur(radius: 120)
				.offset(
					x: -160,
					y: -350
				)

			Circle()
				.fill(
					Color(
						red: 0.25,
						green: 0.10,
						blue: 0.10
					)
					.opacity(0.12)
				)
				.frame(
					width: 400,
					height: 400
				)
				.blur(radius: 130)
				.offset(
					x: 180,
					y: 400
				)
		}
	}
}


// MARK: - Header

private extension ChatDetailView {

	var chatHeader: some View {
		HStack(spacing: 13) {

			// Back button

			Button {
				dismiss()
			} label: {
				Image(systemName: "chevron.left")
					.font(
						.system(
							size: 22,
							weight: .medium
						)
					)
					.foregroundStyle(.white)
					.frame(
						width: 38,
						height: 45
					)
			}

			// Avatar

			ZStack(alignment: .bottomTrailing) {

				Image(user.avatar)
					.resizable()
					.scaledToFill()
					.frame(
						width: 42,
						height: 42
					)
					.clipShape(Circle())

				if user.isOnline {
					Circle()
						.fill(Color.green)
						.frame(
							width: 11,
							height: 11
						)
						.overlay {
							Circle()
								.stroke(
									Color(
										red: 0.055,
										green: 0.055,
										blue: 0.055
									),
									lineWidth: 2
								)
						}
				}
			}

			VStack(
				alignment: .leading,
				spacing: 2
			) {

				HStack(spacing: 5) {

					Text(user.name)
						.font(
							.system(
								size: 16,
								weight: .semibold
							)
						)
						.foregroundStyle(.white)

					if user.isVerified {
						Image(
							systemName:
								"checkmark.seal.fill"
						)
						.font(
							.system(size: 12)
						)
						.foregroundStyle(.white)
					}
				}

				Text(
					user.isOnline
					? "Active now"
					: "Offline"
				)
				.font(
					.system(
						size: 12,
						weight: .regular
					)
				)
				.foregroundStyle(
					user.isOnline
					? Color.white.opacity(0.58)
					: Color.white.opacity(0.40)
				)
			}

			Spacer()

			// Call

			Button {
				// Audio call
			} label: {
				Image(systemName: "phone.fill")
					.font(
						.system(
							size: 18,
							weight: .medium
						)
					)
					.foregroundStyle(.white)
					.frame(
						width: 38,
						height: 42
					)
			}

			// More

			Button {
				// More actions
			} label: {
				Image(systemName: "ellipsis")
					.font(
						.system(
							size: 19,
							weight: .bold
						)
					)
					.foregroundStyle(.white)
					.frame(
						width: 35,
						height: 42
					)
			}
		}
		.padding(.horizontal, 18)
		.padding(.top, 7)
		.padding(.bottom, 10)
		.background {
			Color.black.opacity(0.48)
				.background(.ultraThinMaterial)
		}
		.overlay(alignment: .bottom) {
			Rectangle()
				.fill(
					Color.white.opacity(0.06)
				)
				.frame(height: 0.5)
		}
	}
}


// MARK: - Message List

private extension ChatDetailView {

	var messageList: some View {
		ScrollViewReader { proxy in

			ScrollView(
				.vertical,
				showsIndicators: false
			) {
				LazyVStack(
					alignment: .center,
					spacing: 12
				) {

					todayLabel

					ForEach(messages) { message in
						MessageBubble(
							message: message
						)
						.id(message.id)
					}

					Color.clear
						.frame(height: 5)
						.id("bottom")
				}
				.padding(.horizontal, 17)
				.padding(.top, 20)
				.padding(.bottom, 8)
			}
			.scrollDismissesKeyboard(
				.interactively
			)
			.onAppear {
				scrollToBottom(
					proxy: proxy,
					animated: false
				)
			}
			.onChange(of: messages.count) {
				scrollToBottom(
					proxy: proxy,
					animated: true
				)
			}
		}
	}

	var todayLabel: some View {
		Text("Today")
			.font(
				.system(
					size: 11,
					weight: .medium
				)
			)
			.foregroundStyle(
				Color.white.opacity(0.65)
			)
			.padding(.horizontal, 10)
			.padding(.vertical, 5)
			.background(
				Color.white.opacity(0.08),
				in: Capsule()
			)
			.padding(.bottom, 2)
	}

	func scrollToBottom(
		proxy: ScrollViewProxy,
		animated: Bool
	) {
		DispatchQueue.main.async {
			if animated {
				withAnimation(
					.easeOut(duration: 0.25)
				) {
					proxy.scrollTo(
						"bottom",
						anchor: .bottom
					)
				}
			} else {
				proxy.scrollTo(
					"bottom",
					anchor: .bottom
				)
			}
		}
	}
}


// MARK: - Message Bubble

struct MessageBubble: View {

	let message: ChatMessage

	var body: some View {
		HStack {

			if message.type == .sent {
				Spacer(minLength: 55)
			}

			if message.type == .received {
				receivedContent
			} else {
				sentContent
			}

			if message.type == .received {
				Spacer(minLength: 55)
			}
		}
		.frame(
			maxWidth: .infinity,
			alignment:
				message.type == .sent
			? .trailing
			: .leading
		)
	}
}


// MARK: - Bubble Content

private extension MessageBubble {

	var receivedContent: some View {
		HStack(
			alignment: .bottom,
			spacing: 8
		) {

			Image(message.avatarName ?? "avatar_elsa")
				.resizable()
				.scaledToFill()
				.frame(
					width: 31,
					height: 31
				)
				.clipShape(Circle())

			VStack(
				alignment: .leading,
				spacing: 4
			) {

				if let text = message.text {
					Text(text)
						.font(
							.system(
								size: 15,
								weight: .regular
							)
						)
						.foregroundStyle(.white)
						.padding(.horizontal, 14)
						.padding(.vertical, 10)
						.background(
							Color(
								red: 0.12,
								green: 0.12,
								blue: 0.12
							),
							in: RoundedRectangle(
								cornerRadius: 17,
								style: .continuous
							)
						)
				}

				Text(message.time)
					.font(
						.system(
							size: 9,
							weight: .regular
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.43)
					)
					.padding(.leading, 7)
			}
		}
	}


	var sentContent: some View {
		VStack(
			alignment: .trailing,
			spacing: 3
		) {

			if let text = message.text {

				Text(text)
					.font(
						.system(
							size: 15,
							weight: .regular
						)
					)
					.foregroundStyle(.white)
					.padding(.horizontal, 15)
					.padding(.vertical, 11)
					.background(
						LinearGradient(
							colors: [
								Color(
									red: 0.65,
									green: 0.12,
									blue: 0.25
								),
								Color(
									red: 0.52,
									green: 0.07,
									blue: 0.20
								)
							],
							startPoint: .topLeading,
							endPoint: .bottomTrailing
						),
						in: RoundedRectangle(
							cornerRadius: 17,
							style: .continuous
						)
					)

			} else if let imageName = message.imageName {

				Image(imageName)
					.resizable()
					.scaledToFill()
					.frame(
						width: 155,
						height: 112
					)
					.clipShape(
						RoundedRectangle(
							cornerRadius: 16,
							style: .continuous
						)
					)
					.overlay {
						RoundedRectangle(
							cornerRadius: 16,
							style: .continuous
						)
						.stroke(
							Color.white.opacity(0.08),
							lineWidth: 1
						)
					}
					.background {
						RoundedRectangle(
							cornerRadius: 16,
							style: .continuous
						)
						.fill(
							Color(
								red: 0.55,
								green: 0.08,
								blue: 0.18
							)
						)
						.padding(-5)
					}
			}

			HStack(spacing: 4) {

				Text(message.time)
					.font(
						.system(
							size: 9,
							weight: .regular
						)
					)

				if message.type == .sent {
					Image(
						systemName:
							"checkmark.checkmark"
					)
					.font(
						.system(
							size: 8,
							weight: .semibold
						)
					)
				}
			}
			.foregroundStyle(
				Color.white.opacity(0.48)
			)
			.padding(.trailing, 6)
		}
	}
}


// MARK: - Composer

private extension ChatDetailView {

	var messageComposer: some View {
		HStack(spacing: 9) {

			// Camera

			Button {
				// Camera
			} label: {
				Image(systemName: "camera.fill")
					.font(
						.system(
							size: 17,
							weight: .semibold
						)
					)
					.foregroundStyle(.white)
					.frame(
						width: 37,
						height: 37
					)
					.background(
						Color(
							red: 0.90,
							green: 0.10,
							blue: 0.31
						),
						in: Circle()
					)
			}

			// Text field

			TextField(
				"Message...",
				text: $messageText,
				axis: .vertical
			)
			.font(
				.system(
					size: 14,
					weight: .regular
				)
			)
			.foregroundStyle(.white)
			.tint(.white)
			.lineLimit(1...4)
			.focused($isMessageFieldFocused)

			// Microphone

			Button {
				// Voice recording
			} label: {
				Image(systemName: "mic")
					.font(
						.system(
							size: 18,
							weight: .medium
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.80)
					)
			}

			// Image

			Button {
				// Photo picker
			} label: {
				Image(systemName: "photo")
					.font(
						.system(
							size: 18,
							weight: .medium
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.80)
					)
			}

			// Plus

			Button {
				// Attach menu
			} label: {
				Image(systemName: "plus")
					.font(
						.system(
							size: 17,
							weight: .semibold
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.80)
					)
					.frame(
						width: 31,
						height: 31
					)
					.background(
						Color.white.opacity(0.55),
						in: Circle()
					)
			}
		}
		.padding(.horizontal, 8)
		.padding(.vertical, 8)
		.background(
			Color(
				red: 0.13,
				green: 0.13,
				blue: 0.13
			),
			in: Capsule()
		)
		.overlay {
			Capsule()
				.stroke(
					Color.white.opacity(0.10),
					lineWidth: 1
				)
		}
		.padding(.horizontal, 18)
		.padding(.top, 8)
		.padding(.bottom, 8)
		.background {
			Color.black.opacity(0.55)
		}
	}
}


// MARK: - Models

struct ChatUser {
	let name: String
	let username: String
	let avatar: String
	let isVerified: Bool
	let isOnline: Bool
}


enum MessageType {
	case sent
	case received
}


struct ChatMessage: Identifiable {

	let id = UUID()

	let text: String?
	let imageName: String?
	let time: String
	let type: MessageType

	// Avatar used for received messages.
	// Sent messages don't need one.
	var avatarName: String? = "profile_cover"

	init(
		text: String?,
		imageName: String? = nil,
		time: String,
		type: MessageType,
		avatarName: String? = "profile_cover"
	) {
		self.text = text
		self.imageName = imageName
		self.time = time
		self.type = type
		self.avatarName = avatarName
	}
}


// MARK: - Preview

#Preview {
	ChatDetailView()
}
