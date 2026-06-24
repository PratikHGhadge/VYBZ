//
//  MainViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 17/06/26.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {

	let images = [
		Images.chaha,
		Images.coffee,
		Images.gappatappa,
		Images.me,
		Images.coffeem,
		Images.tea
	]

	func randomPosition(for index: Int, in size: CGSize) -> CGPoint {
		let positions = [
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100)),
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100)),
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100)),
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100)),
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100)),
			CGPoint(x: .random(in: 0...100), y: .random(in: 0...100))
		]
		return positions[index % positions.count]
	}
}
