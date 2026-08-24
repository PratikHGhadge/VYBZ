//
//  VYBZApp.swift
//  VYBZ
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
struct VYBZApp: App {
	@StateObject private var authViewModel = AuthViewModel()
	@StateObject private var router = Router()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@State private var isShowingSplash = true

    var body: some Scene {
        WindowGroup {
			NavigationStack(path: $router.path) {
				ZStack {
					if isShowingSplash {
						LaunchScreenView()
							.transition(.opacity)
							.onAppear {
								// Hold the launch canvas on screen for 2.5 seconds, then fade out
								DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
									withAnimation(.easeInOut(duration: 0.5)) {
										isShowingSplash = false
									}
								}
							}
					} else {
						if authViewModel.isAuthenticated {
							MainView(
								authViewModel: authViewModel,
							)
						} else {
							AuthView(authViewModel: authViewModel)
						}
					}
				}
				.preferredColorScheme(.dark)
				.navigationDestination(for: AppRoute.self) { route in
					switch route {
						case .settings:
							SettingsView(authViewModel: authViewModel)
						case .chatDetail:
							ChatDetailView()
					}
				}
			}
			.environmentObject(router)
		}
	}
}

