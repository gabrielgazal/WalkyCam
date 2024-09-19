//
//  AppNavigator.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/10/23.
//

import SwiftUI

class WatchNavigator: WatchNavigatorProtocol, ObservableObject {
    public static let shared = WatchNavigator()
    @Published var view: AnyView?

    func configure(isUserAlreadyLoggedIn: Bool) {
        view = AnyView(WatchMenuView())
    }
}
