//
//  Router.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 28/06/26.
//

import Foundation
import SwiftUI
import Combine

enum AppRoute: Hashable {
	case settings
	case chatDetail
}

enum Screens: String {
	case Settings = "Settings"
	case ChatDetail = "ChatDetail"
}

class Router: ObservableObject {
	@Published var path = NavigationPath()

	func push(_ route: AppRoute) {
		path.append(route)
	}

	func pop() {
		if path.isEmpty { return }
		path.removeLast()
	}

	func reset(to route: AppRoute) {
		path = NavigationPath()
		path.append(route)
	}
}
