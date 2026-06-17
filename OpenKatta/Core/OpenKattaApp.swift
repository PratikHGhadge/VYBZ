//
//  OpenKattaApp.swift
//  OpenKatta
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}


@main
struct OpenKattaApp: App {
	@StateObject private var viewModel = MainViewModel()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
			NavigationStack {
				MainView(viewModel: viewModel)
			}
        }
    }
}
