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
    var isHandRaised: Bool

    init(connectionId: String, userId: String, userName: String, isHandRaised: Bool) {
        self.connectionId = connectionId
        self.userId = userId
        self.userName = userName
        self.isHandRaised = isHandRaised
    }
}
