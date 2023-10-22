//
//  MainButtonStyle.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

// swiftlint:disable nesting
struct MainButtonStyle: ButtonStyle {

    enum ButtonType {
        case standard(ButtonStyleDescriptorProtocol),
             outline(ButtonStyleDescriptorProtocol)
    }

    private let type: MainButtonStyle.ButtonType

    init(type: MainButtonStyle.ButtonType) {
        self.type = type
    }

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch type {
        case let .standard(descriptor):
            return AnyView(
                StandardButton(configuration: configuration, descriptor: descriptor)
            )
        case let .outline(descriptor):
            return AnyView(
                OutlineButton(configuration: configuration, descriptor: descriptor)
            )
        }
    }

    private struct StandardButton: View {
        enum Metrics {
            static let minHeight: CGFloat = 48
            static let maxHeight: CGFloat = 48
            static let cornerRadius: CGFloat = 24
        }

        private let configuration: ButtonStyle.Configuration
        private let descriptor: ButtonStyleDescriptorProtocol

        @Environment(\.isEnabled) private var isEnabled: Bool

        init(
            configuration: ButtonStyleConfiguration,
            descriptor: ButtonStyleDescriptorProtocol
        ) {
            self.configuration = configuration
            self.descriptor = descriptor
        }

        var body: some View {
            configuration.label
                .font(.projectFont(size: 16, weight: .bold))
                .foregroundColor(isEnabled ? .white : .negro)
                .padding(-10)
                .frame(
                    maxWidth: .infinity,
                    minHeight: Metrics.minHeight,
                    maxHeight: Metrics.maxHeight
                )
                .background(backgroundColor)
                .cornerRadius(Metrics.cornerRadius)
        }

        private var backgroundColor: Color {
            guard isEnabled else {
                return Color.plateado
            }
            return configuration.isPressed ? descriptor.pressedColor : descriptor.mainColor
        }
    }

    private struct OutlineButton: View {
        enum Metrics {
            static let minHeight: CGFloat = 48
            static let maxHeight: CGFloat = 48
            static let cornerRadius: CGFloat = 24
        }

        private let configuration: ButtonStyle.Configuration
        private let descriptor: ButtonStyleDescriptorProtocol

        @Environment(\.isEnabled) private var isEnabled: Bool

        init(
            configuration: ButtonStyleConfiguration,
            descriptor: ButtonStyleDescriptorProtocol
        ) {
            self.configuration = configuration
            self.descriptor = descriptor
        }

        var body: some View {
            configuration.label
                .font(.projectFont(size: 16, weight: .bold))
                .foregroundColor(foregroundColor)
                .padding(-10)
                .frame(maxWidth: .infinity, minHeight: Metrics.minHeight, maxHeight: Metrics.maxHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                        .stroke(isEnabled ? descriptor.mainColor : .blancoGris, lineWidth: 2)
                )
                .background(backgroundColor)
                .cornerRadius(Metrics.cornerRadius)

        }

        private var backgroundColor: Color {
            guard isEnabled else {
                return Color.plateado
            }
            return configuration.isPressed ? descriptor.pressedColor : .clear
        }

        private var foregroundColor: Color {
            guard !configuration.isPressed else {
                return .white
            }
            return isEnabled ? descriptor.mainColor : .negro
        }
    }
}
