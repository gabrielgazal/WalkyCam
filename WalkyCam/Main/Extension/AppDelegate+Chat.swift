//
//  AppDelegate+Chat.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/03/24.
//

import Foundation
import SendbirdChatSDK

extension AppDelegate {
    func initializeChatSDK() {
        let initParams = InitParams(applicationId: "07CFB1E5-4520-4048-A2DF-C615E3DB183F")
        SendbirdChat.initialize(params: initParams)
    }
}
