//
//  MockPostService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class  MockPostService: PostService {

	// Fetch feed posts
	func fetchPosts() async throws -> [Post] {
		try await Task.sleep(for: .milliseconds(300))
		return MockData.posts
	}

	// Fetch individual post
	func fetchPost(id: String) async throws -> Post? {
		try await Task.sleep(for: .milliseconds(300))
		return MockData.posts.first { $0.id == id }
	}

	// Create post
	func createPost(_ post: Post) async throws {
		try await Task.sleep(for: .milliseconds(300))

		MockData.posts.append(post)
	}

	// Delete post
	func deletePost(id: String) async throws {
		try await Task.sleep(for: .milliseconds(300))

		MockData.posts.removeAll {
			$0.id == id
		}
	}
}
