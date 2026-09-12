//
//  ProfileViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 12/09/26.
//

import Foundation
import Observation


enum ProfileTab: String, CaseIterable {
	case library = "Library"
	case videos  = "Videos"
	case saved   = "Saved"

	var icon: String {
		switch self {
			case .library: return "square.grid.2x2.fill"
			case .videos:  return "video.fill"
			case .saved:   return "bookmark.fill"
		}
	}
}

@MainActor
@Observable
final class ProfileViewModel {
	private let postService: PostService
	private let userService: UserService

	var posts: [Post] = []
	var user: User?
	var userStats: UserStats?

	var isLoading = false
	var errorMessage: String?

	init(postService: PostService, userService: UserService) {
		self.postService = postService
		self.userService = userService
	}

	func loadProfile(userID: String) async {
		isLoading = true
		errorMessage = nil

		do {
			async let fetchedUser = userService.fetchUser(id: userID)
			async let fetchedPosts = postService.fetchPosts(userID: userID)
			async let fetchedUserStats = userService.fetchUserStats(userID: userID)
			
			user = try await fetchedUser
			posts = try await fetchedPosts
			userStats = try await fetchedUserStats
		} catch {
			errorMessage = error.localizedDescription
		}
		isLoading = false
	}
}
