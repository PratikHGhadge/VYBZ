//
//  UserStats.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 26/08/26.
//

import Foundation

struct UserStats: Codable {
	let userID: String
	let followersCount: Int
	let followingCount: Int
	let postsCount: Int
}
