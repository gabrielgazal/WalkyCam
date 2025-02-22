//
//  AppDelegate.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/10/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        registerDependencies()
        initializeChatSDK()
        initializePaymentSDK()
        registerDroneDependencies()
        HomeKitManager.shared.fetchDevices()
        return true
    }
}
