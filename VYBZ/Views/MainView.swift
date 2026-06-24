//
//  MainView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
			Text("You are now signed in")

			Button {
//				viewModel.signOut()
			} label: {
				Text("Sign Out")
					.font(.custom(Fonts.bold, size: 18))
					.foregroundColor(.black)
					.padding()
					.frame(maxWidth: .infinity)
					.background(Color(uiColor: .primaryYellow()))
					.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.black, lineWidth: 4)
					)
			}
        }
        .padding()
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}
