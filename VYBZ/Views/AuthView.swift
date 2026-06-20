//
//  AuthView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 18/06/26.
//

import SwiftUI

struct AuthView: View {
	@ObservedObject var viewModel: MainViewModel

	var body: some View {
		ZStack {
			Color(uiColor: .pinkishOrange())
				.ignoresSafeArea(edges: .all)

			GeometryReader { geometry in
				let width = geometry.size.width
				let height = geometry.size.height

				ForEach(0..<viewModel.images.count, id: \.self) { index in
					let image = viewModel.images[index]
					Image(image)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.rotationEffect(.degrees(Double.random(in: -30...30)))
						.position(
							viewModel
								.randomPosition(
									for: index,
									in: CGSize(width: width, height: height)
//										.clipped()
								)
						)


				}
			}
		}
	}
}


#Preview {
	AuthView(viewModel: MainViewModel())
}
