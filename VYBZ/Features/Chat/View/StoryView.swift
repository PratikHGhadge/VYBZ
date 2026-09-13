//
//  StoryView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 21/08/26.
//

import SwiftUI

struct StoryView: View {

	let story: Story
	let user: User

	var body: some View {
		VStack(spacing: 8) {

			ZStack(alignment: .center) {

				Circle()
					.strokeBorder(
						LinearGradient(
							colors: [
								.pink,
								.orange,
								.pink
							],
							startPoint: .topLeading,
							endPoint: .bottomTrailing
						),
						lineWidth: 2
					)
					.frame(width: 72, height: 72)

				Image(user.avatarURL?.absoluteString ?? "")
					.resizable()
					.scaledToFill()
					.frame(
						width: 64,
						height: 64
					)
					.clipShape(Circle())
					.overlay {
						Circle()
							.stroke(
								Color.black.opacity(0.9),
								lineWidth: 2
							)
					}


			}
			.overlay(alignment: .bottomTrailing) {
				// TODO: Add support for user to add its own story
				if false {
					ZStack {
						Circle()
							.fill(.white)

						Image(systemName: "plus")
							.font(
								.system(
									size: 16,
									weight: .bold
								)
							)
							.foregroundStyle(.black)
					}
					.frame(
						width: 27,
						height: 27
					)
				}
			}

			Text(user.displayName)
				.font(
					.system(
						size: 13,
						weight: .medium
					)
				)
				.foregroundStyle(.white)
				.lineLimit(1)
		}
		.frame(width: 73)
	}
}
