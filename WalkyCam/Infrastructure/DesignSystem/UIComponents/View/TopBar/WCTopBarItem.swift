//
//  WCTopBarItem.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import Foundation
import SwiftUI

struct WCTopBarItem: Hashable {
    let iconName: String
    let title: String
    var destination: AnyView?

    init(
        iconName: String,
        title: String,
        destination: AnyView? = nil
    ) {
        self.iconName = iconName
        self.title = title
        self.destination = destination
    }

    static func == (lhs: WCTopBarItem, rhs: WCTopBarItem) -> Bool {
        lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
