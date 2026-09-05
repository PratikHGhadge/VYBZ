//
//  Story.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct Story: Identifiable, Codable {
	let id: String
	let userID: String
	let mediaURL: String
	let mediaType: StoryMediaType
	let createdAt: Date
	let expiresAt: Date
}


enum StoryMediaType: String, Codable {
	case image
	case video
}
