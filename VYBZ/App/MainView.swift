//
//  MainView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

import SwiftUI

struct MainView: View {

	@ObservedObject var authViewModel: AuthViewModel

	@State private var selectedTab: MainTab = .home
	@State private var feedViewModel: FeedViewModel
	@State private var profileViewModel: ProfileViewModel
	@State private var storyViewModel: StoryViewModel

	init(authViewModel: AuthViewModel) {
		self.authViewModel = authViewModel

		_feedViewModel = State(
			initialValue: FeedViewModel(
				postService: MockPostService(),
				userService: MockUserService()
			)
		)

		_profileViewModel = State(
			initialValue: ProfileViewModel(
				postService: MockPostService(),
				userService: MockUserService()
			)
		)

		_storyViewModel = State(
			initialValue: StoryViewModel(
				storyService: MockStoryService(),
				userService: MockUserService()
			)
		)
	}

	var body: some View {
		ZStack(alignment: .bottom) {
			AppBackground().ignoresSafeArea(.all)
			Group {
				switch selectedTab {
					case .home:
						HomeTabView(feedViewModel: feedViewModel)
					case .communities:
						CommunitiesTabView()
					case .create:
						AppBackground()
					case .chat:
						ChatTabView(storyViewModel: storyViewModel)
					case .profile:
						ProfileTabView(profileViewModel: profileViewModel)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			CustomTabBar(selectedTab: $selectedTab)

		}
	}
}

#Preview {
	MainView(
		authViewModel: AuthViewModel()
	)
}
