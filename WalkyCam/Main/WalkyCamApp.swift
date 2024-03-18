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
    @StateObject var locationManager = LocationPermissionManager()

    init() {
        appDelegate.registerDependencies()
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
            .environment(\.colorScheme, .light)
            .onAppear {
                locationManager.requestLocationPermission()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            isPresented = (newPhase == .active ? true : false)
        }
    }
}
