//
//  HomeTabView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 25/06/26.
//

import SwiftUI

// MARK: - Home Feed

struct HomeTabView: View {

	var body: some View {
		ZStack {
			AppBackground()
			VStack(spacing: 0) {
				header
				feed
			}
		}
		.preferredColorScheme(.dark)
	}
}

// MARK: - Header

private extension HomeTabView {

	var header: some View {
		HStack(spacing: 14) {

			Text("Browse your vibe")
				.font(
					.system(
						size: 34,
						weight: .bold,
						design: .rounded
					)
				)
				.foregroundStyle(.white)
				.lineLimit(1)

			Spacer()

			Button {
				// Search
			} label: {
				Image(systemName: "magnifyingglass")
					.font(
						.system(
							size: 18,
							weight: .bold
						)
					)
					.foregroundStyle(.white)
					.frame(width: 40, height: 40)
					.background(
						Color.white.opacity(0.12),
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

// MARK: - Feed

private extension HomeTabView {

	var feed: some View {
		ScrollView(
			.vertical,
			showsIndicators: false
		) {
			LazyVStack(
				spacing: 20
			) {
				ForEach(SocialPost.mockPosts) { post in
					SocialPostCard(post: post)
				}
				Color.clear
					.frame(height: 12)
			}
			.padding(.horizontal, 16)
		}
		.scrollClipDisabled()
	}
}

// MARK: - Preview

#Preview {
	HomeTabView()
}

