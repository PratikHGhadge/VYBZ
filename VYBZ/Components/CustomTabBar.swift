//
//  CustomTabBar.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 25/06/26.
//

import SwiftUI

struct CustomTabBar: View {
	@Binding var selectedTab: MainTab
	var body: some View {
		HStack(spacing: 32) {
			tabButton(
				image: "house",
				tab: .home
			)
			tabButton(
				image: "person.3.fill",
				tab: .communities
			)
			createButton
			tabButton(
				image: "message",
				tab: .chat
			)

			tabButton(
				image: "person.crop.circle.fill",
				tab: .profile
			)
		}
		.padding(.horizontal, 24)
		.padding(.vertical, 4)
		.background {
			RoundedRectangle(cornerRadius: 18)
				.fill(.ultraThinMaterial)
				.overlay {
					RoundedRectangle(cornerRadius: 18)
						.fill(Color.white.opacity(0.04))
				}
		}
		.shadow(
			color: .black.opacity(0.3),
			radius: 20,
			y: 10
		)
		.padding(.horizontal, 24)
		.padding(.bottom, 10)
	}
}

extension CustomTabBar {
	@ViewBuilder
	func tabButton(
		image: String,
		tab: MainTab
	) -> some View {
		Button {
			guard selectedTab != tab else { return }
			withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
				selectedTab = tab
			}
			Haptics.light()
		} label: {
			VStack(spacing: 6) {
				Image(systemName: image)
					.font(.system(size: 22, weight: .medium))
					.foregroundStyle(
						selectedTab == tab
						? .white
						: .white.opacity(0.75)
					)
					.offset(y: selectedTab == tab ? -2 : 0)
					.scaleEffect(selectedTab == tab ? 1.1 : 1)
					.animation(
						.spring(response: 0.35, dampingFraction: 0.75),
						value: selectedTab
					)
					.padding(.top, selectedTab != tab ? 10 : 0)
				Circle()
					.fill(.white)
					.frame(width: 5, height: 5)
					.opacity(selectedTab == tab ? 1 : 0)
					.scaleEffect(selectedTab == tab ? 1 : 0)
					.animation(
						.spring(response: 0.35, dampingFraction: 0.75),
						value: selectedTab
					)
			}
			.frame(width: 32)
		}
	}

	var createButton: some View {
		Button {
			selectedTab = .create
		} label: {
			ZStack {
				Circle()
					.fill(Color.black)
					.scaleEffect(selectedTab == .create ? 1.08 : 1)
					.animation(
						.spring(response: 0.35, dampingFraction: 0.75),
						value: selectedTab
					)

				Image(systemName: "plus")
					.font(
						.system(
							size: 24,
							weight: .medium
						)
					)
					.foregroundStyle(.white)
			}
			.frame(
				width: 56,
				height: 56
			)
			.shadow(
				color: .black.opacity(0.3),
				radius: 10
			)
		}
	}
}

#Preview {
	CustomTabBar(selectedTab: .constant(.home))
}
