//
//  PostGridCell.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 22/08/26.
//

import SwiftUI

// MARK: - Post Grid Cell

struct PostGridCell: View {
	let post: ProfilePost
	var size: CGFloat

	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			Group {
				if UIImage(named: post.imageName) != nil {
					Image(post.imageName)
						.resizable()
						.scaledToFill()
				} else {
					// Placeholder gradient when asset is missing
					RoundedRectangle(cornerRadius: 12, style: .continuous)
						.fill(placeholderGradient(for: post.imageName))
				}
			}
			.frame(width: size, height: size)
			.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

			if post.isVideo {
				Image(systemName: "play.fill")
					.font(.system(size: 10, weight: .bold))
					.foregroundColor(.white)
					.padding(5)
					.background(Circle().fill(Color.black.opacity(0.45)))
					.padding(6)
			}
		}
	}

	private func placeholderGradient(for seed: String) -> LinearGradient {
		let palettes: [[Color]] = [
			[Color(hex: "#C9887A"), Color(hex: "#8B5A55")],
			[Color(hex: "#A0785A"), Color(hex: "#6B4226")],
			[Color(hex: "#D4A7A0"), Color(hex: "#9B6B62")],
			[Color(hex: "#B8927A"), Color(hex: "#7A5040")],
			[Color(hex: "#C4956A"), Color(hex: "#8B5A3C")],
			[Color(hex: "#D4B896"), Color(hex: "#A07852")],
		]
		let idx = abs(seed.hashValue) % palettes.count
		return LinearGradient(colors: palettes[idx], startPoint: .topLeading, endPoint: .bottomTrailing)
	}
}
