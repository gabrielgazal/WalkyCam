//
//  WalkyCamWatchApp.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 10/09/24.
//

import SwiftUI

@main
struct WalkyCamWatch_Watch_AppApp: App {
    @ObservedObject var appNavigator = WatchNavigator.shared
    @Environment(\.scenePhase) var scenePhase
    @State var isPresented = false

    init() {
        appNavigator.configure(isUserAlreadyLoggedIn: UserSession().isLogged())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    appNavigator
                        .view
                }
            }
            .accentColor(Color.red)
            .navigationViewStyle(.stack)
        }
        .onChange(of: scenePhase) { newPhase in
            isPresented = (newPhase == .active ? true : false)
        }
    }
}
