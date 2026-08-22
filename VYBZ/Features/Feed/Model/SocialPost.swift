//
//  SocialPost.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/08/26.
//

import Foundation

struct SocialPost: Identifiable {
	let id = UUID()
	let userName: String
	let userAvatar: String
	let time: String
	let location: String
	let isVerified: Bool
	let imageName: String
	let likes: Int
	let comments: Int
	let isLiked: Bool

	static let mockPosts: [SocialPost] = [
		SocialPost(
			userName: "Pratik Ghadge",
			userAvatar: "profile_cover",
			time: "2h ago",
			location: "Baramati, MH",
			isVerified: true,
			imageName: "post1",
			likes: 341,
			comments: 89,
			isLiked: true
		),
		SocialPost(
			userName: "Pravin Ghadge",
			userAvatar: "profile_cover",
			time: "5h ago",
			location: "Pune, MH",
			isVerified: true,
			imageName: "post2",
			likes: 218,
			comments: 42,
			isLiked: false
		),
		SocialPost(
			userName: "Traveller Pratik",
			userAvatar: "profile_cover",
			time: "8h ago",
			location: "Pune, MH",
			isVerified: false,
			imageName: "post3",
			likes: 506,
			comments: 120,
			isLiked: false
		)
	]
}
