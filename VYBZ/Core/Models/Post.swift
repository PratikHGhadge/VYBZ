//
//  Post.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 22/08/26.
//

import Foundation

struct Post: Identifiable, Codable {
	let id: String
	let authorID: String
	let caption: String
	let mediaURL: String
	let location: String?
	let createdAt: Date
	let updatedAt: Date
	let likeCount: Int
	let commentCount: Int
}
