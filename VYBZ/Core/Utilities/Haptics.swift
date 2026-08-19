//
//  Haptics.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 27/06/26.
//

import UIKit

enum Haptics {

	static func light() {
		let generator = UIImpactFeedbackGenerator(style: .light)
		generator.prepare()
		generator.impactOccurred()
	}

	static func medium() {
		let generator = UIImpactFeedbackGenerator(style: .medium)
		generator.prepare()
		generator.impactOccurred()
	}

	static func heavy() {
		let generator = UIImpactFeedbackGenerator(style: .heavy)
		generator.prepare()
		generator.impactOccurred()
	}

	static func success() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
	}

	static func error() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.error)
	}

	static func selection() {
		let generator = UISelectionFeedbackGenerator()
		generator.selectionChanged()
	}
}
