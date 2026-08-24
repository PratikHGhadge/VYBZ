//
//  ProfileTabView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 25/06/26.
//

import SwiftUI

// MARK: - ProfileTabView

struct ProfileTabView: View {
	let profile: DatabaseUserProfile = DatabaseUserProfile.mock

	@State private var selectedTab: ProfileTab = .library
	@EnvironmentObject var router: Router

	// hero height
	private let coverHeight: CGFloat = 450
	private let collapsedNavHeight: CGFloat = 90

	var body: some View {
		GeometryReader { geo in
			ZStack(alignment: .top) {

				AppBackground()

				// Background tint that extends behind the safe-area
				Color(.clear).ignoresSafeArea()

				ScrollView(showsIndicators: false) {
					VStack(spacing: 0) {

						// Hero cover
						heroCover(geo: geo)

						// Bottom content card
						bottomCard
					}
				}
				.coordinateSpace(name: "scroll")

				// Floating top-right menu button over hero
				VStack {
					HStack {
						Spacer()
						moreButton
							.padding(.top, geo.safeAreaInsets.top + 45)
							.padding(.trailing, 18)
					}
					Spacer()
				}
			}
		}
		.ignoresSafeArea(edges: .top)
	}

	// MARK: - Hero Cover

	@ViewBuilder
	private func heroCover(geo: GeometryProxy) -> some View {
		ZStack(alignment: .bottomLeading) {
			// Photo
			coverImage
				.frame(width: geo.size.width, height: coverHeight)
				.clipped()

			// Gradient overlay (bottom-up)
			LinearGradient(
				colors: [.clear, .black.opacity(0.18), .black.opacity(0.62)],
				startPoint: .top,
				endPoint: .bottom
			)
			.frame(height: coverHeight)

			// Name + tags
			VStack(alignment: .leading, spacing: 8) {
				Text(profile.userName ?? "")
					.font(.system(size: 30, weight: .bold, design: .default))
					.foregroundColor(.white)

				HStack(spacing: 6) {
					ForEach(profile.tags ?? [""], id: \.self) {
						TagChip(text: $0)
					}
					Spacer()
					Text(
						profile.joinedDate?
							.formatted(.dateTime) ?? Date()
							.formatted(.dateTime)
					)
						.font(.system(size: 11, weight: .regular))
						.foregroundColor(.white.opacity(0.70))
				}
			}
			.padding(.horizontal, 20)
			.padding(.bottom, 16)
		}
		.clipShape(
			RoundedRectangle(cornerRadius: 28, style: .continuous)
		)
		.shadow(radius: 28)
	}

	// MARK: - Cover Image

	@ViewBuilder
	private var coverImage: some View {
		if UIImage(named: profile.coverImageName ?? "profile_cover") != nil {
			Image(profile.coverImageName ?? "profile_cover")
				.resizable()
				.scaledToFill()
		} else {
			// Placeholder warm earthy gradient matching the design palette
			LinearGradient(
				colors: [
					Color(hex: "#C4956A"),
					Color(hex: "#9B6B62"),
					Color(hex: "#6B4040"),
				],
				startPoint: .topLeading,
				endPoint: .bottomTrailing
			)
		}
	}

	// MARK: - Bottom Card

	private var bottomCard: some View {
		VStack(spacing: 16) {

			// Follower / Following row
			HStack(spacing: 12) {
				StatCardView(stat: profile.followers, label: "Followers")
				StatCardView(stat: profile.following, label: "Following")
			}
			.padding(.horizontal, 16)

			// Tab selector
			ProfileTabSelector(selected: $selectedTab)
				.padding(.horizontal, 16)

			// Post grid
			postGrid
				.padding(.horizontal, 16)
				.padding(.bottom, 100)
		}
		.padding(.top, 24)
	}

	// MARK: - Post Grid

	private var postGrid: some View {
		let columns = [
			GridItem(.flexible(), spacing: 8),
			GridItem(.flexible(), spacing: 8),
		]

		return LazyVGrid(columns: columns, spacing: 8) {
			ForEach(filteredPosts) { post in
				GeometryReader { g in
					PostGridCell(post: post, size: g.size.width)
				}
				.aspectRatio(1, contentMode: .fit)
			}
		}
	}

	private var filteredPosts: [ProfilePost] {
		switch selectedTab {
			case .library: return profile.posts ?? []
			case .videos:  return profile.posts?.filter(\.isVideo) ?? []
			case .saved:   return profile.posts ?? []
		}
	}

	// MARK: - More Button

	private var moreButton: some View {
		Button {
			router.push(.settings)
		} label: {
			Image(systemName: "ellipsis")
				.rotationEffect(.degrees(0))
				.font(.system(size: 18, weight: .bold))
				.foregroundColor(.white)
				.frame(width: 32, height: 32)
				.background(Color.white.opacity(0.35))
				.clipShape(RoundedRectangle(cornerRadius: 8))
		}
	}
}

// MARK: - Stacked Avatar Row

struct StackedAvatarsView: View {
	let imageNames: [String]
	var size: CGFloat = 28

	var body: some View {
		HStack(spacing: -(size * 0.35)) {
			ForEach(imageNames.prefix(3), id: \.self) { name in
				Group {
					if UIImage(named: name) != nil {
						Image(name)
							.resizable()
							.scaledToFill()
					} else {
						// Placeholder gradient circle when asset is missing
						Circle()
							.fill(placeholderGradient(for: name))
					}
				}
				.frame(width: size, height: size)
				.clipShape(Circle())
				.overlay(Circle().stroke(Color.white.opacity(0.25), lineWidth: 1.5))
			}
		}
	}

	private func placeholderGradient(for seed: String) -> LinearGradient {
		let colors: [[Color]] = [
			[.pink, .orange],
			[.purple, .blue],
			[.green, .teal],
			[.red, .yellow],
		]
		let idx = abs(seed.hashValue) % colors.count
		return LinearGradient(colors: colors[idx], startPoint: .topLeading, endPoint: .bottomTrailing)
	}
}

// MARK: - Stat Card

struct StatCardView: View {
	let stat: ProfileStat
	let label: String

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 6) {
				StackedAvatarsView(imageNames: stat.avatarImageNames)
				Text("\(stat.count) \(label)")
					.font(.system(size: 14, weight: .medium))
					.foregroundColor(.white)
			}
			Spacer()
			Image(systemName: "arrow.up.right")
				.font(.system(size: 13, weight: .semibold))
				.foregroundColor(.white.opacity(0.7))
				.padding(6)
				.background(Color.white.opacity(0.12))
				.clipShape(Circle())
		}
		.padding(.horizontal, 14)
		.padding(.vertical, 14)
		.background(
			RoundedRectangle(cornerRadius: 18, style: .continuous)
				.fill(Color.white.opacity(0.13))
		)
	}
}

// MARK: - Tag Chip

struct TagChip: View {
	let text: String

	var body: some View {
		Text(text)
			.font(.system(size: 11, weight: .medium))
			.foregroundColor(.white.opacity(0.85))
			.padding(.horizontal, 10)
			.padding(.vertical, 5)
			.background(
				Capsule()
					.fill(Color.white.opacity(0.15))
			)
	}
}

// MARK: - Tab Selector

struct ProfileTabSelector: View {
	@Binding var selected: ProfileTab

	var body: some View {
		HStack(spacing: 0) {
			ForEach(ProfileTab.allCases, id: \.self) { tab in
				Button {
					withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
						selected = tab
					}
				} label: {
					HStack(spacing: 6) {
						Image(systemName: tab.icon)
							.font(.system(size: 12, weight: .semibold))
						Text(tab.rawValue)
							.font(.system(size: 13, weight: .semibold))
					}
					.foregroundColor(selected == tab ? .white : .white.opacity(0.5))
					.padding(.vertical, 10)
					.frame(maxWidth: .infinity)
					.background(
						Group {
							if selected == tab {
								Capsule()
									.fill(Color.white.opacity(0.22))
							}
						}
					)
				}
			}
		}
		.padding(4)
		.background(
			RoundedRectangle(cornerRadius: 14, style: .continuous)
				.fill(Color.white.opacity(0.10))
		)
	}
}

// MARK: - Color Hex Extension

extension Color {
	init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)
		let a, r, g, b: UInt64
		switch hex.count {
			case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
			case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
			case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
			default:(a, r, g, b) = (1, 1, 1, 0)
		}
		self.init(
			.sRGB,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue: Double(b) / 255,
			opacity: Double(a) / 255
		)
	}
}


// MARK: - Preview

#Preview {
	ProfileTabView()
}

