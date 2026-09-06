//
//  MockPostInteractionService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class MockPostInteractionService: PostInteractionService {

	// Like post
	func likePost(postID: String, userID: String) async throws {
		try await Task.sleep(for: .milliseconds(300))

		let alreadyLiked = MockData.postLikes.contains {
			$0.postID == postID && $0.userID == userID
		}

		guard !alreadyLiked else {
			return
		}

		let like = PostLike(
			id: UUID().uuidString,
			postID: postID,
			userID: userID,
			createdAt: Date()
		)

		MockData.postLikes.append(like)
	}

	// Unlike post
	func unlikePost(postID: String, userID: String) async throws {
		try await Task.sleep(for: .milliseconds(300))

		MockData.postLikes.removeAll {
			$0.postID == postID && $0.userID == userID
		}
		return
	}

	// Fetch comments for the specific post
	func fetchComments(postID: String) async throws -> [Comment] {
		try await Task.sleep(for : .milliseconds(300))

		return MockData.comments.filter {
			$0.postID == postID
		}
	}

	// Add comment on post
	func addComment(postID: String, comment: Comment) async throws {
		try await Task.sleep(for: .milliseconds(300))
		MockData.comments.append(comment)
	}
}
