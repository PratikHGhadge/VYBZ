//
//  NewMessageUser.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 21/08/26.
//

import Foundation

struct NewMessageUser: Identifiable {

	let id = UUID()

	let name: String
	let username: String
	let avatar: String
	let verified: Bool


	static let mockUsers: [NewMessageUser] = [
		NewMessageUser(
			name: "Pratik Ghadge",
			username: "@ghadgePratik",
			avatar: "profile_cover",
			verified: true
		),
		NewMessageUser(
			name: "Pravin Ghadge",
			username: "@ghadge Pravin",
			avatar: "profile_cover",
			verified: true
		),
		NewMessageUser(
			name: "Mayur",
			username: "@mayur",
			avatar: "profile_cover",
			verified: false
		),
		NewMessageUser(
			name: "Pavan",
			username: "@pavan",
			avatar: "profile_cover",
			verified: true
		),
		NewMessageUser(
			name: "Ritesh",
			username: "@ritesh",
			avatar: "profile_cover",
			verified: false
		),
		NewMessageUser(
			name: "Patric ",
			username: "@patric",
			avatar: "profile_cover",
			verified: false
		)
	]

}
