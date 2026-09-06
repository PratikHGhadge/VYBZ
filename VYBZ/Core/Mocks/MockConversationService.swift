//
//  MockConversationService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class MockConversationService: ConversationService {

	// Fetch conversations for a user
	func fetchConversations(userID: String) async throws -> [Conversation] {
		try await Task.sleep(for: .milliseconds(300))

		return MockData.conversations.filter {
			$0.participantIDs.contains(userID)
		}
	}

	// Fetch one specific conversation
	func fetchConversation(id: String) async throws -> Conversation? {
		try await Task.sleep(for: .milliseconds(300))

		return MockData.conversations.first { $0.id == id }
	}
}
