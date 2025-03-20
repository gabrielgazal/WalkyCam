//
//  VideoView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.


import SwiftUI
import WebRTC

struct VideoView: UIViewRepresentable {
    
    var remoteVideoTrack: RTCVideoTrack?
    
    func makeUIView(context: Context) -> RTCEAGLVideoView {
        let view = RTCEAGLVideoView()
        view.backgroundColor = .blue
        return view
    }
    
    func updateUIView(_ uiView: RTCEAGLVideoView, context: Context) {
        remoteVideoTrack?.add(uiView)
    }
}
