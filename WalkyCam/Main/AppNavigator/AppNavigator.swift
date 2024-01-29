//
//  AppNavigator.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/10/23.
//

import SwiftUI

class AppNavigator: AppNavigatorProtocol, ObservableObject {
    public static let shared = AppNavigator()
    @Published var view: AnyView?

    func configure(isUserAlreadyLoggedIn: Bool) {
        view = isUserAlreadyLoggedIn ? HomeRoute(isPresented: .constant(false)).build() : LoginRoute(isPresented: .constant(false)).build()
    }
}
