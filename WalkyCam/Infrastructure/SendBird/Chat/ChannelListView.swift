//
//  ChannelListView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 05/02/24.
//

import SwiftUI
import SendbirdUIKit

class ChannelListViewController: UIViewController {

    @objc
    func displaySendbirdChannelList() {
        let clvc = SBUGroupChannelListViewController()
        let navc = UINavigationController(rootViewController: clvc)
        navc.title = "Sendbird SwiftUI Demo"
        navc.modalPresentationStyle = .fullScreen
        present(navc, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displaySendbirdChannelList()
    }
}

struct ChannelListViewContainer: UIViewControllerRepresentable {

       typealias UIViewControllerType = ChannelListViewController

       func makeUIViewController(context: Context) -> ChannelListViewController {
           return ChannelListViewController()
       }

       func updateUIViewController(_ uiViewController: ChannelListViewController, context: Context) {}
}
