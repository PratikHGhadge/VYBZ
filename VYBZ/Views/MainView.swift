//
//  MainView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

import SwiftUI

struct MainView: View {
	
	@ObservedObject var mainViewModel: MainViewModel
	@ObservedObject var authViewModel: AuthViewModel
	
	@State private var selectedTab: MainTab = .home

	var body: some View {
			ZStack(alignment: .bottom) {
				AppBackground().ignoresSafeArea(.all)
				Group {
					switch selectedTab {
						case .home:
							HomeTabView()
						case .communities:
							CommunitiesTabView()
						case .create:
							AppBackground()
						case .chat:
							ChatTabView()
						case .profile:
							ProfileTabView(
								authViewModel: authViewModel,
								mainViewModel: mainViewModel
							)
					}
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.padding(.bottom, 70)
				CustomTabBar(selectedTab: $selectedTab)

			}
	}
}

#Preview {
	MainView(
		mainViewModel: MainViewModel(),
		authViewModel: AuthViewModel()
	)
}
