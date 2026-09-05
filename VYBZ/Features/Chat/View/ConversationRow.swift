//
//  ConversationRow.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 22/08/26.
//

import SwiftUI

// MARK: - Conversation Row

struct ConversationRow: View {

	let conversation: Conversation

	var body: some View {
		HStack(spacing: 15) {

			avatar

			VStack(
				alignment: .leading,
				spacing: 5
			) {
				HStack(spacing: 5) {

					Text("Prati")
						.font(
							.system(
								size: 18,
								weight: .semibold
							)
						)
						.foregroundStyle(.white)
						.lineLimit(1)

					if true {
						Image(systemName: "checkmark.seal.fill")
							.font(.system(size: 13))
							.foregroundStyle(.white)
					}
				}

				Text("conversation preview")
					.font(
						.system(
							size: 15,
							weight: .regular
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.60)
					)
					.lineLimit(1)
			}

			Spacer(minLength: 4)

			VStack(
				alignment: .trailing,
				spacing: 9
			) {
				Text("7:04 PM")
					.font(
						.system(
							size: 14,
							weight: .medium
						)
					)
					.foregroundStyle(
						Color.white.opacity(0.62)
					)

				if conversation.unreadCount > 0 {
					unreadBadge
				} else if true {
					Circle()
						.fill(Color.blue)
						.frame(
							width: 10,
							height: 10
						)
				}
			}
		}
		.padding(.horizontal, 17)
		.frame(height: 88)
		.background(
			Color.white.opacity(0.055),
			in: RoundedRectangle(
				cornerRadius: 20,
				style: .continuous
			)
		)
		.overlay {
			RoundedRectangle(
				cornerRadius: 20,
				style: .continuous
			)
			.stroke(
				Color.white.opacity(0.07),
				lineWidth: 1
			)
		}
	}

	private var avatar: some View {
		ZStack(alignment: .bottomTrailing) {

			Image("profile_cover")
				.resizable()
				.scaledToFill()
				.frame(
					width: 58,
					height: 58
				)
				.clipShape(Circle())
				.overlay {
					Circle()
						.stroke(
							Color.white.opacity(0.10),
							lineWidth: 1
						)
				}

			if true {
				Circle()
					.fill(Color.green)
					.frame(
						width: 15,
						height: 15
					)
					.overlay {
						Circle()
							.stroke(
								Color(
									red: 0.075,
									green: 0.065,
									blue: 0.065
								),
								lineWidth: 2
							)
					}
					.offset(
						x: 1,
						y: 1
					)
			}
		}
	}

	private var unreadBadge: some View {
		Text(
			"\(conversation.unreadCount)"
		)
		.font(
			.system(
				size: 12,
				weight: .bold
			)
		)
		.foregroundStyle(.white)
		.frame(
			width: 25,
			height: 25
		)
		.background(
			Color.pink,
			in: Circle()
		)
	}
}
