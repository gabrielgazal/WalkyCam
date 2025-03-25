//
//  VideoView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.


import SwiftUI
import WebRTC

struct VideoView: UIViewRepresentable {
    let videoTrack: RTCVideoTrack

        func makeUIView(context: Context) -> RTCMTLVideoView {
            let view = RTCMTLVideoView(frame: .zero)
            videoTrack.add(view)
            return view
        }

        func updateUIView(_ uiView: RTCMTLVideoView, context: Context) {}
}
