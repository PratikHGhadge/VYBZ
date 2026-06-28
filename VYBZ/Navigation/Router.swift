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
}

class Router: ObservableObject {
	@Published var path = NavigationPath()

	func push(_ route: AppRoute) {
		path.append(route)
	}

	func pop() {
		path.removeLast()
	}

	func reset(to route: AppRoute) {
		path = NavigationPath()
		path.append(route)
	}
}
