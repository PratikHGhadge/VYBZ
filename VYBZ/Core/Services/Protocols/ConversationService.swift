//
//  ConversationService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol ConversationService {

	// Fetch conversations for a user
	func fetchConversations(userID: String) async throws -> [Conversation]

	// Fetch one specific conversation
	func fetchConversation(id: String) async throws -> Conversation?
}
