//
//  UIColor+Ext.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 14/06/26.
//

import UIKit
import SwiftUI

// MARK: - App Custom Color Palette
extension UIColor {
	class func creamText() -> UIColor {
		return UIColor(hex: 0xFFFAF4)
	}

	class func darkPinkTone() -> UIColor {
		return UIColor(hex: 0xF07167)
	}

	class func gameGreen() -> UIColor {
		return UIColor(hex: 0x6BD46A)
	}

	class func neonYellow() -> UIColor {
		return UIColor(hex: 0xD3F33A)
	}

	class func primaryYellow() -> UIColor {
		return UIColor(hex: 0xFFCB03)
	}

	class func mildYellow() -> UIColor {
		return UIColor(hex: 0xFFEF7D)
	}

	class func pinkishOrange() -> UIColor {
		return UIColor(hex: 0xFC7A6A)
	}

	class func dirtyGreen() -> UIColor {
		return UIColor(hex: 0xD4BE13)
	}
}

// MARK: - Hex Initialization Extension

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")

		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
	}

	convenience init(hex: Int, alpha: CGFloat = 1.0) {
		self.init(
			red: (hex >> 16) & 0xFF,
			green: (hex >> 8) & 0xFF,
			blue: hex & 0xFF,
			alpha: alpha
		)
	}
}

// MARK: - SwiftUI Extension Wrapper
extension Color {
	static let creamText = Color(uiColor: .creamText())
	static let darkPinkTone = Color(uiColor: .darkPinkTone())
	static let gameGreen = Color(uiColor: .gameGreen())
	static let neonYellow = Color(uiColor: .neonYellow())
	static let primaryYellow = Color(uiColor: .primaryYellow())
	static let mildYellow = Color(uiColor: .mildYellow())
	static let pinkishOrange = Color(uiColor: .pinkishOrange())
	static let dirtyGreen = Color(uiColor: .dirtyGreen())
}

