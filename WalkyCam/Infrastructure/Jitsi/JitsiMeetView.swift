//
//  JitsiMeetView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/12/23.
//

import SwiftUI
import JitsiMeetSDK

struct JitsiMeetWrapper: UIViewControllerRepresentable {
    let jitsiMeetView: JitsiMeetView
    @Binding var pipViewCoordinator: PiPViewCoordinator?
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.addSubview(jitsiMeetView)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Implement if needed
    }
}

class JitsiMeetDelegateWrapper: NSObject, JitsiMeetViewDelegate {
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
