//
//  Conversation.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 21/08/26.
//

import Foundation

struct Conversation: Identifiable {

	let id = UUID()

	let name: String
	let username: String
	let avatar: String
	let preview: String
	let time: String
	let unreadCount: Int
	let isOnline: Bool
	let isVerified: Bool
	var hasBlueDot: Bool = false

	static let mockConversations: [Conversation] = [
		Conversation(
			name: "Pratik Ghadge",
			username: "@ghadgePratik",
			avatar: "profile_cover",
			preview: "Hey! How are you?",
			time: "2m",
			unreadCount: 2,
			isOnline: true,
			isVerified: true
		),
		Conversation(
			name: "Pravin Ghadge",
			username: "@ghadgePravin",
			avatar: "profile_cover",
			preview: "Loved your latest post 🔥",
			time: "15m",
			unreadCount: 1,
			isOnline: true,
			isVerified: true
		),
		Conversation(
			name: "Patric ",
			username: "@patric",
			avatar: "profile_cover",
			preview: "Let’s catch up tomorrow.",
			time: "1h",
			unreadCount: 0,
			isOnline: false,
			isVerified: false
		),
		Conversation(
			name: "Ritesh",
			username: "@ritesh",
			avatar: "profile_cover",
			preview: "Sent you a reel",
			time: "3h",
			unreadCount: 0,
			isOnline: false,
			isVerified: true,
			hasBlueDot: true
		),
		Conversation(
			name: "Pavan",
			username: "@pavan",
			avatar: "profile_cover",
			preview: "Thanks! 🙌",
			time: "5h",
			unreadCount: 0,
			isOnline: false,
			isVerified: false
		),
		Conversation(
			name: "Mayur",
			username: "@mayur",
			avatar: "profile_cover",
			preview: "Sounds good.",
			time: "8h",
			unreadCount: 0,
			isOnline: false,
			isVerified: false
		)
	]

}
