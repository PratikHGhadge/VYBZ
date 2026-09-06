//
//  MockStoryService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

final class MockStoryService: StoryService {

	// Fetch available stories
	func fetchStories() async throws -> [Story] {
		try await Task.sleep(for: .milliseconds(300))

		return MockData.stories
	}

	// Fetch viewers for a specific story
	func fetchStoryViewers(storyID: String) async throws -> [StoryViewer] {
		try await Task.sleep(for: .milliseconds(300))
		return MockData.storyViewers.filter { $0.storyID == storyID }
	}

	// Mark a story as viewed
	func markStoryAsViewed(_ viewer: StoryViewer) async throws {
		try await Task.sleep(for: .milliseconds(300))

		let alreadyViewed = MockData.storyViewers.contains {
			$0.storyID == viewer.storyID &&
			$0.userID == viewer.userID
		}

		guard !alreadyViewed else {
			return
		}

		MockData.storyViewers.append(viewer)
	}
}
