//
//  Comment.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct Comment: Identifiable, Codable {
	let id: String
	let postID: String
	let userID: String
	let text: String

	let createdAt: Date
	let updatedAt: Date
}
