//
//  AppDelegate+Chat.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation
import SendbirdChatSDK

extension AppDelegate {
    func initializeChatSDK() {
        let initParams = InitParams(applicationId: "7BCB9668-EC01-4AE3-BBA9-5C42E39867E2")
        SendbirdChat.initialize(params: initParams)
    }
}
