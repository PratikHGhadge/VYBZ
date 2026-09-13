//
//  StoryViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 13/09/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class StoryViewModel {
	private let storyService: StoryService
	private let userService: UserService

	var stories: [Story] = []
	var users: [User] = []

	var isLoading = false
	var errorMessage: String?

	init(storyService: StoryService, userService: UserService) {
		self.storyService = storyService
		self.userService = userService
	}

	func loadStories() async {
		isLoading = true
		errorMessage = nil

		do {
			async let fetchedUsers = userService.fetchUsers()
			async let fetchedStories = storyService.fetchStories()

			users = try await fetchedUsers
			stories = try await fetchedStories
		} catch {
			errorMessage = error.localizedDescription
		}
		isLoading = false
	}

	func user(for story: Story) -> User? {
		users.first {
			$0.id == story.userID
		}
	}
}

