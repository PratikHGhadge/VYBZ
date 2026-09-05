//
//  Message.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct Message: Identifiable, Codable {
	let id: String
	let conversationID: String
	let senderID: String
	let text: String?
	let mediaURL: String?
	let type: MessageType
	let createdAt: Date
	let isRead: Bool
}

enum MessageType: String, Codable {
	case text
	case image
	case video
	case voice
}
