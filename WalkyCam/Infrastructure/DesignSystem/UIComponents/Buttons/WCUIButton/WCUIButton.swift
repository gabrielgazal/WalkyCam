//
//  WCUIButton.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 12/10/23.
//

import SwiftUI

public struct WCUIButton: View {

    private let title: String?
    private let icon: String?
    private let style: ButtonStyles
    private let descriptor: ButtonStyleDescriptorProtocol
    private let action: () -> Void

    init(
        title: String? = nil,
        icon: String? = nil,
        style: ButtonStyles = .standard,
        descriptor: ButtonStyleDescriptorProtocol,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.descriptor = descriptor
        self.action = action
    }

    public var body: some View {
        Button(
            action: action,
            label: {
                HStack(spacing: 8) {
                    if let icon = icon {
                        Image(icon)
                    }
                    if let title = title {
                        Text(title)
                    }
                }
        }).style(buttonType)
    }

    private var buttonType: MainButtonStyle.ButtonType {
        switch style {
        case .standard:
            return .standard(descriptor)
        case .outline:
            return .outline(descriptor)
        }
    }
}
