//
//  MockUserService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class MockUserService: UserService {

	// fetch user
	func fetchUser(id: String) async throws -> User? {
		try await Task.sleep(for: .milliseconds(300))
		return MockData.users.first { $0.id == id }
	}

	// fetch users
	func fetchUsers() async throws -> [User] {
		try await Task.sleep(for: .milliseconds(300))
		return MockData.users
	}

	// Get followers/following/post counts
	func fetchUserStats(userID: String) async throws -> UserStats {
		try await Task.sleep(for: .milliseconds(300))
		guard let stats = MockData.userStats.first(where: {
			$0.userID == userID
		}) else {
			throw MockUserServiceError.userStatsNotFound
		}
		return stats
	}
}

// MARK: - Errors

enum MockUserServiceError: Error {
	case userStatsNotFound
}
