//
//  SocialPostCard.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/08/26.
//

import SwiftUI

struct SocialPostCard: View {

	let post: SocialPost

	@State private var liked: Bool
	@State private var likes: Int
	@State private var showComments = false

	init(post: SocialPost) {
		self.post = post
		_liked = State(initialValue: post.isLiked)
		_likes = State(initialValue: post.likes)
	}

	var body: some View {
		ZStack {
			postImage
			VStack(spacing: 0) {
				postHeader
				Spacer()
				engagementBar
					.padding(25)
			}
		}
		.background(
			Color.black.opacity(0.10)
		)
		.clipShape(
			RoundedRectangle(
				cornerRadius: 18,
				style: .continuous
			)
		)
		.overlay {
			RoundedRectangle(
				cornerRadius: 18,
				style: .continuous
			)
			.stroke(
				Color.white.opacity(0.08),
				lineWidth: 1
			)
		}
		.shadow(
			color: .black.opacity(0.25),
			radius: 18,
			x: 0,
			y: 9
		)
	}
}

// MARK: - Post Image

private extension SocialPostCard {

	var postImage: some View {
		ZStack {
			Image(post.imageName)
				.resizable()
				.scaledToFill()
				.frame(
					maxWidth: .infinity
				)
				.aspectRatio(
					0.82,
					contentMode: .fit
				)
				.clipped()

			// Subtle bottom gradient for readability.
			LinearGradient(
				colors: [
					.clear,
					.black.opacity(0.16)
				],
				startPoint: .center,
				endPoint: .bottom
			)
		}
	}
}


private extension SocialPostCard {

	var engagementBar: some View {
		HStack(spacing: 18) {
			Button {
				toggleLike()
			} label: {
				HStack(spacing: 5) {
					Image(
						systemName:
							liked
						? "heart.fill"
						: "heart"
					)
					.foregroundStyle(
						liked
						? Color.pink
						: Color.white
					)

					Text(
						likes.formatted()
					)
					.foregroundStyle(
						Color.white.opacity(0.88)
					)
				}
			}

			Button {
				showComments = true
			} label: {
				HStack(spacing: 5) {
					Image(
						systemName:
							"bubble.right"
					)

					Text(
						post.comments.formatted()
					)
					.foregroundStyle(
						Color.white.opacity(0.88)
					)
				}
			}

			Button {
				// Save
			} label: {
				Image(
					systemName: "bookmark"
				)
			}
		}
		.font(
			.system(
				size: 18,
				weight: .semibold
			)
		)
		.foregroundStyle(.white)
		.padding(.horizontal, 10)
		.frame(height: 45)
		.background(
			Color.white.opacity(0.28),
			in: RoundedRectangle(cornerRadius: 12)
		)
		.sheet(
			isPresented: $showComments
		) {
			CommentsView(post: post)
				.presentationDetents(
					[.medium, .large]
				)
		}
	}

	func toggleLike() {
		liked.toggle()

		if liked {
			likes += 1
		} else {
			likes = max(0, likes - 1)
		}
	}
}

// MARK: - Post Header

private extension SocialPostCard {

	var postHeader: some View {
		HStack(spacing: 11) {

			Image(post.userAvatar)
				.resizable()
				.scaledToFill()
				.frame(
					width: 42,
					height: 42
				)
				.clipShape(Circle())
				.overlay {
					Circle()
						.stroke(
							Color.white.opacity(0.50),
							lineWidth: 1
						)
				}

			VStack(
				alignment: .leading,
				spacing: 3
			) {

				HStack(spacing: 5) {
					Text(post.userName)
						.font(
							.system(
								size: 15,
								weight: .bold
							)
						)

					if post.isVerified {
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

				HStack(spacing: 6) {
					Text(post.time)

					Text("•")

					Text(post.location)
				}
				.font(
					.system(
						size: 11,
						weight: .medium
					)
				)
				.foregroundStyle(
					.white.opacity(0.62)
				)
			}

			Spacer()

			Button {
				// Follow user
			} label: {
				Text("Follow")
					.font(
						.system(
							size: 13,
							weight: .semibold
						)
					)
					.foregroundStyle(.white)
					.padding(.horizontal, 19)
					.frame(height: 38)
					.background(
						Color.white.opacity(0.28),
						in: RoundedRectangle(cornerRadius: 6)
					)
					.overlay {
						RoundedRectangle(cornerRadius: 8)
							.stroke(
								Color.white.opacity(0.10),
								lineWidth: 1
							)
					}
			}
		}
		.padding(
			EdgeInsets(
				top: 14,
				leading: 15,
				bottom: 13,
				trailing: 15
			)
		)
	}
}

#Preview {
	SocialPostCard(post: SocialPost.mockPosts.first!)
}
