//
//  WalkyCamApp.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/10/23.
//

import SwiftUI

@main
struct WalkyCamApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @ObservedObject var appNavigator = AppNavigator.shared
    @Environment(\.scenePhase) var scenePhase
    @State var isPresented = false
    
    init() {
        //FirebaseConfiguration().configureFirebaseOnApplication()
        appNavigator.configure(isUserAlreadyLoggedIn: false)
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
            .environment(\.colorScheme, .light)
        }
        .onChange(of: scenePhase) { newPhase in
            isPresented = (newPhase == .active ? true : false)
        }
    }
}
