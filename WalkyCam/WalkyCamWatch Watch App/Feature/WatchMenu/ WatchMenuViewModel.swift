//
//   WatchMenuViewModel.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 12/09/24.
//

import Foundation

class WatchMenuViewModel: ObservableObject {
    func getUserName() -> String {
        guard let userName = try? UserSession().user().name else { return "User" }
        return userName
    }
}
