//
//  UserService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol UserService {

	// Get one specific user
	func fetchUser(id: String) async throws -> User?

	// Get multiple users
	func fetchUsers() async throws -> [User]

	// Get followers/following/post counts
	func fetchUserStats(userID: String) async throws -> UserStats
}
