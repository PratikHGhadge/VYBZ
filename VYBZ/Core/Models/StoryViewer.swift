//
//  StoryViewer.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct StoryViewer: Identifiable, Codable {
	let id: String
	let storyID: String
	let userID: String
	let viewedAt: Date
}
