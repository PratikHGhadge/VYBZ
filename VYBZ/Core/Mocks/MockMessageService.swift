//
//  MockMessageService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class MockMessageService: MessageService {

	// Fetch messages for a conversation
	func fetchMessages(conversationID: String) async throws -> [Message] {
		try await Task.sleep(nanoseconds: 100_000_000)

		return MockData.messages.filter { $0.conversationID == conversationID }
	}

	// Send a new message
	func sendMessage(_ message: Message) async throws {
		try await Task.sleep(nanoseconds: 100_000_000)
		MockData.messages.append(message)
	}

	// Mark a message as read
	func markMessageAsRead(messageID: String) async throws {
		try await Task.sleep(nanoseconds: 100_000_000)

		guard let index = MockData.messages.firstIndex(where: {
			$0.id == messageID
		}) else {
			return
		}
		
		let message = MockData.messages[index]

		MockData.messages[index] = Message(
			id: message.id,
			conversationID: message.conversationID,
			senderID: message.senderID,
			text: message.text,
			mediaURL: message.mediaURL,
			type: message.type,
			createdAt: message.createdAt,
			isRead: true
		)
	}
}
