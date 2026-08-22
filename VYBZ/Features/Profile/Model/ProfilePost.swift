//
//  ProfilePost.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 29/06/26.
//
import Foundation

struct ProfilePost: Identifiable {
	let id: UUID
	let imageName: String
	let isVideo: Bool

	static let mockPosts: [ProfilePost] = [
		ProfilePost(id: UUID(), imageName: "post1", isVideo: false),
		ProfilePost(id: UUID(), imageName: "post2", isVideo: false),
		ProfilePost(id: UUID(), imageName: "post3", isVideo: true),
		ProfilePost(id: UUID(), imageName: "post4", isVideo: false),
		ProfilePost(id: UUID(), imageName: "post5", isVideo: false),
		ProfilePost(id: UUID(), imageName: "post6", isVideo: true),
	]
}
