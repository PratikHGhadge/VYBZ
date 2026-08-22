//
//  LaunchScreenView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/06/26.
//

import SwiftUI

struct LaunchScreenView: View {

	@State private var animate = false

	var body: some View {
		ZStack {
            // Background color
			AppBackground()

			// Middle Circular Glow Effect
			VibeGlow()

			VStack(spacing: 24) {
				Spacer()
				Image("VYBZlogo")
					.resizable()
					.scaledToFit()
					.frame(width: 180)
					.scaleEffect(true ? 1 : 0.92)

				Text("VYBZ")
					.font(.system(size: 42, weight: .bold))
					.foregroundStyle(.white)

				Text("YOUR TRIBE. YOUR VIBE.")
					.font(.caption)
					.tracking(2)
					.foregroundStyle(.white.opacity(0.7))
				Spacer()

				// Loading Dots
				LoadingDots()
			}
		}
		.onAppear {
			animate = true
		}
	}
}

#Preview {
	LaunchScreenView()
}
