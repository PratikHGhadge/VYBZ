//
//  PostLike.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct PostLike: Identifiable, Codable {
	let id: String
	let postID: String
	let userID: String
	let createdAt: Date
}
