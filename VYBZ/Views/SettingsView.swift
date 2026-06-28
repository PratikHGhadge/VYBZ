//
//  SettingsView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 27/06/26.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var authViewModel: AuthViewModel
	@EnvironmentObject var router: Router

	var body: some View {
		List {
			Section(header: Text("Account Options").foregroundColor(.gray)) {
				Button(role: .destructive) {
					authViewModel.signOut()
				} label: {
					HStack {
						Image(systemName: "arrow.left.square")
						Text("Sign Out of VYBZ")
					}
				}
			}
		}
		.navigationTitle("Settings")
		.navigationBarTitleDisplayMode(.inline)
		.onDisappear() {
			router.pop()
		}
	}
}

#Preview {
	SettingsView(authViewModel: AuthViewModel())
}
