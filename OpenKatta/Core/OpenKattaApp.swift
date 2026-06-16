//
//  OpenKattaApp.swift
//  OpenKatta
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

@main
struct OpenKattaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.onAppear {
					for family in UIFont.familyNames.sorted() {
						let names = UIFont.fontNames(forFamilyName: family)
					}
				}
        }
    }
}
