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
    var renderer: RTCVideoRenderer? {
        didSet {
            // If a renderer is set after a track already arrived, attach it
            if let old = oldValue, let track = videoTrack {
                track.remove(old)
            }
            if let renderer = renderer, let track = videoTrack {
                print("✅ Renderer set for \(userName), attaching existing track")
                track.add(renderer)
            }
        }
    }
    @Published var videoTrack: RTCVideoTrack? {
        didSet {
            // If a track arrives after the renderer was set, attach it
            if let old = oldValue, let renderer = renderer {
                old.remove(renderer)
            }
            if let track = videoTrack, let renderer = renderer {
                print("🎬 VideoTrack set for \(userName), attaching to renderer")
                track.add(renderer)
            }
        }
    }
    @Published var audioTrack: RTCAudioTrack?
    @Published var isVideoEnabled: Bool
    @Published var isAudioEnabled: Bool
    @Published var isHandRaised: Bool
    
    public init(
        connectionId: String,
        userId: String,
        userName: String,
        peerConnection: RTCPeerConnection? = nil,
        renderer: RTCVideoRenderer? = nil,
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
        self.renderer = renderer
        self.videoTrack = videoTrack
        self.audioTrack = audioTrack
        self.isHandRaised = isHandRaised
        self.isVideoEnabled = isVideoEnabled
        self.isAudioEnabled = isAudioEnabled
    }
}
