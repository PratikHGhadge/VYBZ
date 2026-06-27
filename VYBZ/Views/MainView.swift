//
//  MainView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel: MainViewModel
	@ObservedObject var authViewModel: AuthViewModel
	
	@State private var selectedTab: MainTab = .home

	var body: some View {
		
		ZStack(alignment: .bottom) {
			TabView(selection: $selectedTab) {
				HomeTabView()
					.tag(MainTab.home)
					.toolbarVisibility(.hidden, for: .tabBar)
				CommunitiesTabView()
					.tag(MainTab.communities)
					.toolbarVisibility(.hidden, for: .tabBar)
				Color.clear
					.tag(MainTab.create)
					.toolbarVisibility(.hidden, for: .tabBar)
				ChatTabView()
					.tag(MainTab.chat)
					.toolbarVisibility(.hidden, for: .tabBar)
				ProfileTabView()
					.tag(MainTab.profile)
					.toolbarVisibility(.hidden, for: .tabBar)
			}

			CustomTabBar(selectedTab: $selectedTab)
		}
	}
}

#Preview {
	MainView(
		viewModel: MainViewModel(),
		authViewModel: AuthViewModel()
	)
}
