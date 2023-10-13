//
//  Button+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

extension Button {
    func style(_ type: MainButtonStyle.ButtonType) -> some View {
        self.buttonStyle(MainButtonStyle(type: type))
    }

    func linkButton(style: LinkButtonStyle = LinkButtonStyle()) -> some View {
        self.buttonStyle(style)
    }
}
