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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
				.font(Font.custom(Fonts.bold, size: 30))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
