//
//  ProfileViewModel.swift
//  VYBZ
//
//  Created by Pratik Haridas Ghadge on 29/06/26.
//
import Foundation
import Combine

enum ProfileTab: String, CaseIterable {
	case library = "Library"
	case videos  = "Videos"
	case saved   = "Saved"

	var icon: String {
		switch self {
			case .library: return "square.grid.2x2.fill"
			case .videos:  return "video.fill"
			case .saved:   return "bookmark.fill"
		}
	}
}

class ProfileViewModel: ObservableObject {

}
