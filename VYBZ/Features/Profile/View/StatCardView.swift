//
//  StatCardView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 12/09/26.
//

import SwiftUI

struct StatCardView: View {
	let stat: Int
	let label: String

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 6) {
//				StackedAvatarsView(imageNames: stat.avatarImageNames)
				Text("\(stat) \(label)")
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
