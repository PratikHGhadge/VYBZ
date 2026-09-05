//
//  StoryService.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 05/09/26.
//

import Foundation

protocol StoryService {

	// Fetch available stories
	func fetchStories() async throws -> [Story]

	// Fetch viewers for a specific story
	func fetchStoryViewers(storyID: String) async throws -> [StoryViewer]

	// Mark a story as viewed
	func markStoryAsViewed(_ viewer: StoryViewer) async throws
}
