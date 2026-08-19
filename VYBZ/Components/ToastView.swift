//
//  ToastView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 14/06/26.
//

import Foundation
import SwiftUI

struct ToastView: View {
	let message: String

	var body: some View {
		Text(message)
			.font(.custom(Fonts.bold, size: 14)) 
			.foregroundStyle(.black)
			.padding()
			.background(Color(uiColor: .gameGreen()))
			.cornerRadius(10)
			.shadow(radius: 10)
	}
}

// MARK: - Preview Provider
#Preview {
	ZStack {
		Color.gray.opacity(0.3).ignoresSafeArea()
		ToastView(message: "Post shared successfully on VYBZ!")
	}
}
