//
//  MockData.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 06/09/26.
//

import Foundation

enum MockData {

	// MARK: - Users

	static var users: [User] = [

		User(
			id: "user_001",
			userName: "pratikghadge",
			displayName: "Pratik Ghadge",
			email: "pratik@gmail.com",
			avatarURL: URL(string: "profile_cover"),
			coverImageURL: URL(string: "profile_cover"),
			isVerified: true,
			createdAt: Date(),
			updatedAt: Date(),
			tags: ["Coder", "Photographer", "Creator"]
		),

		User(
			id: "user_002",
			userName: "pravinghadge",
			displayName: "Pravin Ghadge",
			email: "pravin@gmail.com",
			avatarURL: URL(string: "profile_cover"),
			coverImageURL: URL(string: "profile_cover"),
			isVerified: true,
			createdAt: Date(),
			updatedAt: Date(),
			tags: ["Creator", "Traveler"]
		),

		User(
			id: "user_003",
			userName: "travellerpratik",
			displayName: "Traveller Pratik",
			email: nil,
			avatarURL: URL(string: "profile_cover"),
			coverImageURL: nil,
			isVerified: false,
			createdAt: Date(),
			updatedAt: Date(),
			tags: ["Traveler", "Photography"]
		)
	]


	// MARK: - User Stats

	static var userStats: [UserStats] = [

		UserStats(
			userID: "user_001",
			followersCount: 2400,
			followingCount: 150,
			postsCount: 2
		),

		UserStats(
			userID: "user_002",
			followersCount: 1800,
			followingCount: 220,
			postsCount: 2
		),

		UserStats(
			userID: "user_003",
			followersCount: 5200,
			followingCount: 310,
			postsCount: 2
		)
	]


	// MARK: - Posts

	static var posts: [Post] = [

		Post(
			id: "post_001",
			authorID: "user_001",
			caption: "Building something new 🚀",
			mediaURL: "post1",
			mediaType: .photo,
			location: "Baramati, MH",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 341,
			commentsCount: 89
		),

		Post(
			id: "post_002",
			authorID: "user_002",
			caption: "Another beautiful day ✨",
			mediaURL: "post2",
			mediaType: .photo,
			location: "Pune, MH",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 218,
			commentsCount: 42
		),

		Post(
			id: "post_003",
			authorID: "user_003",
			caption: "Exploring new places 🌍",
			mediaURL: "post3",
			mediaType: .video,
			location: "Pune, MH",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 506,
			commentsCount: 120
		),

		Post(
			id: "post_004",
			authorID: "user_001",
			caption: "Weekend vibes 📸",
			mediaURL: "post4",
			mediaType: .photo,
			location: "Mumbai, MH",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 187,
			commentsCount: 31
		),

		Post(
			id: "post_005",
			authorID: "user_002",
			caption: "Good times with good people.",
			mediaURL: "post5",
			mediaType: .photo,
			location: "Pune, MH",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 264,
			commentsCount: 54
		),

		Post(
			id: "post_006",
			authorID: "user_003",
			caption: "Adventure continues 🎥",
			mediaURL: "post6",
			mediaType: .video,
			location: "Goa, India",
			createdAt: Date(),
			updatedAt: Date(),
			likesCount: 412,
			commentsCount: 76
		)
	]


	// MARK: - Post Likes

	static var postLikes: [PostLike] = [

		PostLike(
			id: "like_001",
			postID: "post_001",
			userID: "user_001",
			createdAt: Date()
		),

		PostLike(
			id: "like_002",
			postID: "post_002",
			userID: "user_001",
			createdAt: Date()
		),

		PostLike(
			id: "like_003",
			postID: "post_003",
			userID: "user_002",
			createdAt: Date()
		),

		PostLike(
			id: "like_004",
			postID: "post_004",
			userID: "user_002",
			createdAt: Date()
		)
	]


	// MARK: - Comments

	static var comments: [Comment] = [

		Comment(
			id: "comment_001",
			postID: "post_001",
			userID: "user_002",
			text: "This looks amazing!",
			createdAt: Date(),
			updatedAt: Date()
		),

		Comment(
			id: "comment_002",
			postID: "post_001",
			userID: "user_003",
			text: "Great work 🔥",
			createdAt: Date(),
			updatedAt: Date()
		),

		Comment(
			id: "comment_003",
			postID: "post_002",
			userID: "user_001",
			text: "Nice one!",
			createdAt: Date(),
			updatedAt: Date()
		),

		Comment(
			id: "comment_004",
			postID: "post_003",
			userID: "user_001",
			text: "Where is this place?",
			createdAt: Date(),
			updatedAt: Date()
		)
	]


	// MARK: - Stories

	static var stories: [Story] = [

		Story(
			id: "story_001",
			userID: "user_001",
			mediaURL: "post1",
			mediaType: .image,
			createdAt: Date(),
			expiresAt: Date().addingTimeInterval(60 * 60 * 20)
		),

		Story(
			id: "story_002",
			userID: "user_002",
			mediaURL: "post2",
			mediaType: .image,
			createdAt: Date(),
			expiresAt: Date().addingTimeInterval(60 * 60 * 18)
		),

		Story(
			id: "story_003",
			userID: "user_003",
			mediaURL: "post3",
			mediaType: .video,
			createdAt: Date(),
			expiresAt: Date().addingTimeInterval(60 * 60 * 12)
		)
	]


	// MARK: - Story Viewers

	static var storyViewers: [StoryViewer] = [

		StoryViewer(
			id: "viewer_001",
			storyID: "story_001",
			userID: "user_002",
			viewedAt: Date()
		),

		StoryViewer(
			id: "viewer_002",
			storyID: "story_001",
			userID: "user_003",
			viewedAt: Date()
		),

		StoryViewer(
			id: "viewer_003",
			storyID: "story_002",
			userID: "user_001",
			viewedAt: Date()
		)
	]


	// MARK: - Conversations

	static var conversations: [Conversation] = [

		Conversation(
			id: "conversation_001",
			participantIDs: [
				"user_001",
				"user_002"
			],
			lastMessageID: "message_002",
			createdAt: Date(),
			updatedAt: Date(),
			unreadCount: 2
		),

		Conversation(
			id: "conversation_002",
			participantIDs: [
				"user_001",
				"user_003"
			],
			lastMessageID: "message_004",
			createdAt: Date(),
			updatedAt: Date(),
			unreadCount: 0
		)
	]


	// MARK: - Messages

	static var messages: [Message] = [

		Message(
			id: "message_001",
			conversationID: "conversation_001",
			senderID: "user_002",
			text: "Hey Pratik!",
			mediaURL: nil,
			type: .text,
			createdAt: Date(),
			isRead: true
		),

		Message(
			id: "message_002",
			conversationID: "conversation_001",
			senderID: "user_001",
			text: "Hey! How are you?",
			mediaURL: nil,
			type: .text,
			createdAt: Date(),
			isRead: false
		),

		Message(
			id: "message_003",
			conversationID: "conversation_002",
			senderID: "user_003",
			text: "Ready for the trip?",
			mediaURL: nil,
			type: .text,
			createdAt: Date(),
			isRead: true
		),

		Message(
			id: "message_004",
			conversationID: "conversation_002",
			senderID: "user_001",
			text: "Absolutely! 🚀",
			mediaURL: nil,
			type: .text,
			createdAt: Date(),
			isRead: true
		)
	]
}

private enum MockID {
	static var pratik = "user_001"
	static var pravin = "user_002"
	static var traveller = "user_003"

	static var post1 = "post_001"
	static var post2 = "post_002"
	static var post3 = "post_003"
	static var post4 = "post_004"
	static var post5 = "post_005"
	static var post6 = "post_006"
}
