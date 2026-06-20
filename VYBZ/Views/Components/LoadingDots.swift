//
//  LoadingDots.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/06/26.
//

import SwiftUI

struct LoadingDots: View {

	@State private var animate = false

	var body: some View {
		HStack(spacing: 8) {
			ForEach(0..<3) { index in
				Circle()
					.fill(
						LinearGradient(
							colors: [.pink, .cyan],
							startPoint: .topLeading,
							endPoint: .bottomTrailing
						)
					)
					.frame(width: 10, height: 10)
					.scaleEffect(animate ? 1.2 : 0.7)
					.onAppear {
						animate = true
					}
					.animation(
						.easeInOut(duration: 1)
						.repeatForever()
						.delay(Double(index) * 0.2),
						value: animate
					)
			}
		}
		.padding(.top, 20)
	}
}
