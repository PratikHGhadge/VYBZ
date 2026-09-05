//
//  UserData.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 24/06/26.
//

import Foundation
import FirebaseAuth

struct UserData {
	let uID: String
	let email: String?

	init(user: FirebaseAuth.User) {
		self.uID = user.uid
		self.email = user.email
	}
}
