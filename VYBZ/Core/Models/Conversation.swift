//
//  Conversation.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct Conversation: Codable, Identifiable {
	let id: String
	let participantIDs: [String]
	let lastMessageID: String?
	let createdAt: Date
	let updatedAt: Date
	let unreadCount: Int
}
