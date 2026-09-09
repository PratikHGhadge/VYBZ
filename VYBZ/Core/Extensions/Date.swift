//
//  Date.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 09/09/26.
//

import Foundation

extension Date {

	static func randomPastDate() -> Date {
		let secondsInTwoYears: TimeInterval = 2 * 365 * 24 * 60 * 60
		let randomInterval = TimeInterval.random(in: 0...secondsInTwoYears)

		return Date().addingTimeInterval(-randomInterval)
	}

	var timeAgo: String {
		let formatter = RelativeDateTimeFormatter()
		formatter.unitsStyle = .abbreviated
		return formatter.localizedString(for: self, relativeTo: Date())
	}
}
