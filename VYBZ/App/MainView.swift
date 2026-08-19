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
	
	@State private var selectedTab: MainTab = .profile

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
							ProfileTabView()
					}
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				CustomTabBar(selectedTab: $selectedTab)

			}
	}
}

#Preview {
	MainView(
//		mainViewModel: MainViewModel(),
		authViewModel: AuthViewModel()
	)
}
