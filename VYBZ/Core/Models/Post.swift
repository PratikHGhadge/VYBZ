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
	let caption: String?
	let mediaURL: String?
	let mediaType: PostMediaType
	let location: String?
	let createdAt: Date
	let updatedAt: Date
	let likesCount: Int
	let commentsCount: Int
}

enum PostMediaType: String, Codable {
	case photo
	case video
}
