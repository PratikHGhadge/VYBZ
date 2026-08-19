//
//  DatabaseUser.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 28/06/26.
//

import Foundation

struct DatabaseUserProfile {
	let userID: String?
	let email: String?
	let userName: String?
	let coverImageName: String?
	let tags: [String]?
	let joinedDate: Date?
	let followers: ProfileStat
	let following: ProfileStat
	var posts: [ProfilePost]?

	static let mock = DatabaseUserProfile(
		userID: UUID().uuidString,
		email: "pratik@gmail.com",
		userName: "Pratik Ghadge",
		coverImageName: "profile_cover",
		tags: ["Coder", "Photographer", "Creator"],
		joinedDate: Date(),
		followers: ProfileStat(count: "2.4K", avatarImageNames: ["avatar1", "avatar2", "avatar3"]),
		following: ProfileStat(count: "150",  avatarImageNames: ["avatar4", "avatar5"]),
		posts: ProfilePost.mockPosts
	)
}



extension DateFormatter {
	static let userFriendly: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .short
		return formatter
	}()
}

struct ProfileStat {
	let count: String
	let avatarImageNames: [String]
}
