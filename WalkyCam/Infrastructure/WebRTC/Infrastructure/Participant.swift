//
//  Participant.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import WebRTC

class Participant: ObservableObject, Identifiable {
    let connectionId: String
    let userId: String
    let userName: String
    var peerConnection: RTCPeerConnection?
    @Published var videoTrack: RTCVideoTrack?
    @Published var audioTrack: RTCAudioTrack?
    @Published var isVideoEnabled: Bool
    @Published var isAudioEnabled: Bool
    @Published var isHandRaised: Bool
    
    public init(
        connectionId: String,
        userId: String,
        userName: String,
        peerConnection: RTCPeerConnection? = nil,
        videoTrack: RTCVideoTrack? = nil,
        audioTrack: RTCAudioTrack? = nil,
        isHandRaised: Bool = false,
        isVideoEnabled: Bool = false,
        isAudioEnabled: Bool = false
    ) {
        self.connectionId = connectionId
        self.userId = userId
        self.userName = userName
        self.peerConnection = peerConnection
        self.videoTrack = videoTrack
        self.audioTrack = audioTrack
        self.isHandRaised = isHandRaised
        self.isVideoEnabled = isVideoEnabled
        self.isAudioEnabled = isAudioEnabled
    }
}
