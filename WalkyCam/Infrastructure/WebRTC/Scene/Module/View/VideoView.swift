////
////  VideoView.swift
////  WalkyCam
////
////  Created by Gabriel Gazal on 17/03/25.
////
//
//import SwiftUI
//import CoreAudio
//import WebRTC
//
//struct VideoView: UIViewRepresentable {
//    var videoTrack: RTCVideoTrack?
//    
//    func makeUIView(context: Context) -> RTCMTLVideoView {
//        let videoView = RTCMTLVideoView()
//        videoView.videoContentMode = .scaleAspectFit
//        return videoView
//    }
//    
//    func updateUIView(_ uiView: RTCMTLVideoView, context: Context) {
//        videoTrack?.add(uiView)
//    }
//}
