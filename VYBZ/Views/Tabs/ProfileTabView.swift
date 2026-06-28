//
//  ProfileTabView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 25/06/26.
//

import SwiftUI

struct ProfileTabView: View {
	@ObservedObject var authViewModel: AuthViewModel
	@ObservedObject var mainViewModel: MainViewModel
	@EnvironmentObject var router: Router

	var body: some View {
		NavigationStack {
			ZStack {
				AppBackground().ignoresSafeArea()
				VStack(spacing: 20) {
					Image(systemName: "person.crop.circle.fill")
						.resizable()
						.frame(width: 100, height: 100)
						.foregroundColor(.white.opacity(0.8))

					Text(authViewModel.authUserData?.email ?? "User Tribe")
						.font(.title2.bold())
						.foregroundColor(.white)

					Text(authViewModel.authUserData?.uID ?? "User  uID")
						.font(.title2.bold())
						.foregroundColor(.white)

					Spacer()
				}
				.padding(.top, 40)
			}
			.navigationTitle("My Profile")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						router.push(.settings)
					} label: {
						Image(systemName: "gearshape")
							.font(.system(size: 18, weight: .medium))
							.foregroundColor(.white)
					}
				}
			}
		}
	}
}


#Preview {
	ProfileTabView(authViewModel: AuthViewModel(), mainViewModel: MainViewModel())
}
