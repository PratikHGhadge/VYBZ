//
//  CommentsView.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 20/08/26.
//

import SwiftUI

struct CommentsView: View {

	let post: Post
	let user: User

	var body: some View {
		NavigationStack {
			VStack {
				Spacer()

				Text("Comments")
					.font(.headline)

				Text(
					"Comments Connect API will be connected here"
				)
				.foregroundStyle(.secondary)

				Spacer()
			}
			.navigationTitle(user.userName)
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}
