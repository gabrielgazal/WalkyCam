//
//  RTCVideoRendererView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/04/25.
//

import SwiftUI
import WebRTC

struct RTCVideoRendererView: UIViewRepresentable {
    let videoTrack: RTCVideoTrack?
    
    func makeUIView(context: Context) -> RTCMTLVideoView {
        let view = RTCMTLVideoView()
        view.videoContentMode = .scaleAspectFill
        view.isUserInteractionEnabled = false
        return view
    }

    func updateUIView(_ uiView: RTCMTLVideoView, context: Context) {
        videoTrack?.remove(uiView)
        videoTrack?.add(uiView)
    }
}
