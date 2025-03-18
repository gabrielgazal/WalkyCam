//
//  Participant.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import WebRTC

class Participant {
    let connectionId: String
    let userId: String
    let userName: String
    var peerConnection: RTCPeerConnection?
    var videoTrack: RTCVideoTrack?

    init(connectionId: String, userId: String, userName: String) {
        self.connectionId = connectionId
        self.userId = userId
        self.userName = userName
    }
}
