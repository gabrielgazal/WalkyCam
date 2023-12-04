//
//  JitsiMeetView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/12/23.
//

import SwiftUI
import JitsiMeetSDK

struct JitsiMeetWrapper: UIViewControllerRepresentable {
    let roomName: String

    class Coordinator: NSObject, JitsiMeetViewDelegate {
        var onReadyToClose: (() -> Void)?
        var onEnterPictureInPicture: (() -> Void)?

        init(onReadyToClose: (() -> Void)? = nil, onEnterPictureInPicture: (() -> Void)? = nil) {
            self.onReadyToClose = onReadyToClose
            self.onEnterPictureInPicture = onEnterPictureInPicture
        }

        func ready(toClose data: [AnyHashable : Any]!) {
            onReadyToClose?()
        }

        func enterPicture(inPicture data: [AnyHashable : Any]!) {
            onEnterPictureInPicture?()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let jitsiMeetView = JitsiMeetView()
        jitsiMeetView.delegate = context.coordinator

        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            builder.serverURL = URL(string: "https://meet.jit.si/")
            builder.room = roomName
        }

        jitsiMeetView.join(options)
        viewController.view.addSubview(jitsiMeetView)

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Implement if needed
    }
}
