//
//  VibeGlow.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/06/26.
//

import SwiftUI

struct VibeGlow: View {

	@State private var animate = false

	var body: some View {
		Circle()
			.fill(
				RadialGradient(
					colors: [
						.brown.opacity(0.4),
						.clear
					],
					center: .center,
					startRadius: 50,
					endRadius: 250
				)
			)
			.scaleEffect(animate ? 1.1 : 0.9)
			.blur(radius: 40)
			.onAppear {
				animate = true
			}
			.animation(
				.easeInOut(duration: 2)
				.repeatForever(autoreverses: true),
				value: animate
			)
	}
}
