//
//  ContentView.swift
//  OpenKatta
//
//  Created by Pratik Haridas Ghadge on 13/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
			ToastView(message: "Hello")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
