//
//  FeedViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class FeedViewModel {

	private let postService: PostService
	private let userService: UserService

	var posts: [Post] = []
	var users: [User] = []

	var isLoading = false
	var errorMessage: String?

	init(
		postService: PostService,
		userService: UserService
	) {
		self.postService = postService
		self.userService = userService
	}
	
	func loadFeed() async {
		isLoading = true
		errorMessage = nil

		do {
			posts = try await postService.fetchPosts()
			users = try await userService.fetchUsers()
		} catch {
			errorMessage = error.localizedDescription
		}
		isLoading = false
	}

	func user(for post: Post) -> User? {
		users.first {
			$0.id == post.authorID
		}
	}
}
