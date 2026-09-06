//
//  MessageService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol MessageService {

	// Fetch messages for a conversation
	func fetchMessages(conversationID: String) async throws -> [Message]

	// Send a new message
	func sendMessage(_ message: Message) async throws

	// Mark a message as read
	func markMessageAsRead(messageID: String) async throws
}
