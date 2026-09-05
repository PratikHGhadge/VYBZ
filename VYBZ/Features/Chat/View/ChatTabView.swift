//
//  ChatTabView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 25/06/26.
//

import SwiftUI

// MARK: - ChatTabView

struct ChatTabView: View {

	@State private var searchText = ""
	@State private var showNewMessage = false
	@EnvironmentObject var router: Router

	var body: some View {
		NavigationStack {
			ZStack {
				AppBackground()

				VStack(spacing: 0) {
					header

					searchBar

					storiesSection

					conversationList
				}
			}
			.toolbar(.hidden, for: .navigationBar)
			.sheet(isPresented: $showNewMessage) {
				NewMessageView()
			}
		}
		.preferredColorScheme(.dark)
	}
}

// MARK: - Header

private extension ChatTabView {

	var header: some View {
		HStack(alignment: .center) {

			Text("Messages")
				.font(
					.system(
						size: 34,
						weight: .bold,
						design: .rounded
					)
				)
				.foregroundStyle(.white)

			Spacer()

			Button {
				showNewMessage = true
			} label: {
				ZStack {
					Image(systemName: "bubble.left.fill")
						.font(
							.system(
								size: 18,
								weight: .semibold
							)
						)

					Image(systemName: "plus")
						.font(
							.system(
								size: 10,
								weight: .bold
							)
						)
						.offset(x: 6, y: -6)
				}
				.foregroundStyle(.white)
				.frame(width: 40, height: 40)
				.background(
					Color.white.opacity(0.11),
					in: RoundedRectangle(
						cornerRadius: 12,
						style: .continuous
					)
				)
				.overlay {
					RoundedRectangle(
						cornerRadius: 12,
						style: .continuous
					)
					.stroke(
						Color.white.opacity(0.10),
						lineWidth: 1
					)
				}
			}
		}
		.padding(.horizontal, 24)
		.padding(.top, 8)
		.padding(.bottom, 18)
	}
}

// MARK: - Search

private extension ChatTabView {

	var searchBar: some View {
		HStack(spacing: 12) {

			Image(systemName: "magnifyingglass")
				.font(
					.system(
						size: 20,
						weight: .medium
					)
				)
				.foregroundStyle(
					Color.white.opacity(0.60)
				)

			TextField(
				"Search messages",
				text: $searchText
			)
			.font(
				.system(
					size: 17,
					weight: .regular
				)
			)
			.foregroundStyle(.white)
			.tint(.white)

			Button {
				// Filter action
			} label: {
				Image(systemName: "slider.horizontal.3")
					.font(
						.system(
							size: 19,
							weight: .medium
						)
					)
					.foregroundStyle(.white)
			}
		}
		.padding(.horizontal, 19)
		.frame(height: 58)
		.background(
			Color.white.opacity(0.10),
			in: RoundedRectangle(
				cornerRadius: 19,
				style: .continuous
			)
		)
		.overlay {
			RoundedRectangle(
				cornerRadius: 19,
				style: .continuous
			)
			.stroke(
				Color.white.opacity(0.08),
				lineWidth: 1
			)
		}
		.padding(.horizontal, 24)
	}
}

// MARK: - Stories

private extension ChatTabView {

	var storiesSection: some View {
		ScrollView(
			.horizontal,
			showsIndicators: false
		) {
			HStack(spacing: 18) {
				ForEach(ChatStory.mockStories) { story in
					StoryView(story: story)
				}
			}
			.padding(.horizontal, 24)
			.padding(.top, 21)
			.padding(.bottom, 19)
		}
	}
}


// MARK: - Conversation List

private extension ChatTabView {

	var conversationList: some View {
		ScrollView(
			.vertical,
			showsIndicators: false
		) {
			LazyVStack(spacing: 10) {

//				ForEach(filteredConversations) { conversation in
//					ConversationRow(conversation: conversation)
//						.onTapGesture {
//							router.push(.chatDetail)
//						}
//				}
				Color.clear
					.frame(height: 22)
			}
			.padding(.horizontal, 22)
		}
	}
}

// MARK: - Preview

#Preview {
	ChatTabView()
}
