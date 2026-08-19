//
//  AppBackground.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/06/26.
//

import SwiftUI

struct AppBackground: View {
	var body: some View {
		LinearGradient(
			colors: [
				.black,
				Color(red: 0.12, green: 0.08, blue: 0.15)
			],
			startPoint: .top,
			endPoint: .bottom
		)
		.ignoresSafeArea()
	}
}
