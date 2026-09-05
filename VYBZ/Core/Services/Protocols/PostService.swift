//
//  PostService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol PostService {

	// Fetch feed posts
	func fetchPosts() async throws -> [Post]

	// Fetch individual post
	func fetchPost(id: String) async throws -> Post?

	// Create post
	func createPost(_ post: Post) async throws

	// Delete post
	func deletePost(id: String) async throws
}
