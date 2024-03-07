//
//  MessageObserver.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Foundation
import SendbirdChatSDK
import Combine

class MessageObserver: NSObject, ObservableObject, GroupChannelDelegate {
    let objectWillChange = ObservableObjectPublisher()
    var newMessage: BaseMessage?

    func channel(_ channel: BaseChannel, didReceive message: BaseMessage) {
        objectWillChange.send()
        self.newMessage = message
    }
}
