//
//  PostInteractionService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol PostInteractionService {

	// Like
	func likePost(postID: String, userID: String) async throws

	// Unlike
	func unlikePost(postID: String, userID: String) async throws

	// Fetch comments
	func fetchComments(postID: String) async throws -> [Comment]

	// Add comment
	func addComment(postID: String, comment: Comment) async throws
}
