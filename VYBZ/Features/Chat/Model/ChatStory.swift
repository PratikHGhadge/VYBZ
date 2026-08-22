//
//  ChatStory.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 21/08/26.
//

import Foundation

struct ChatStory: Identifiable {

	let id = UUID()

	let name: String
	let avatar: String
	let hasPlus: Bool
	let isViewed: Bool

	static let mockStories: [ChatStory] = [
		ChatStory(
			name: "Your note",
			avatar: "profile_cover",
			hasPlus: true,
			isViewed: false
		),
		ChatStory(
			name: "Pravin",
			avatar: "profile_cover",
			hasPlus: false,
			isViewed: true
		),
		ChatStory(
			name: "Prathamesh",
			avatar: "avatar_prathamesh",
			hasPlus: false,
			isViewed: false
		),
		ChatStory(
			name: "Mayur",
			avatar: "avatar_mayur",
			hasPlus: false,
			isViewed: false
		),
		ChatStory(
			name: "Pavan",
			avatar: "avatar_pavan",
			hasPlus: false,
			isViewed: false
		)
	]
}
