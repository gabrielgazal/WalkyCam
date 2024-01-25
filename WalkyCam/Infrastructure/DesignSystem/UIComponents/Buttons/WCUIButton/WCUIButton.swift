//
//  WCUIButton.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 12/10/23.
//

import SwiftUI

private struct Loading: EnvironmentKey {
    static let defaultValue = false
}

public extension EnvironmentValues {
    var isLoading: Bool {
        get { self[Loading.self] }
        set { self[Loading.self] = newValue }
    }
}

public extension View {
    func loading(_ bool: Bool = true) -> some View {
        environment(\.isLoading, bool)
    }
}

public struct WCUIButton: View {

    @Environment(\.isLoading) var isLoading

    private let title: String?
    private let leftIcon: String?
    private let rightIcon: String?
    private let style: ButtonStyles
    private let descriptor: ButtonStyleDescriptorProtocol
    private let action: () -> Void

    init(
        title: String? = nil,
        leftIcon: String? = nil,
        rightIcon: String? = nil,
        style: ButtonStyles = .standard,
        descriptor: ButtonStyleDescriptorProtocol,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.style = style
        self.descriptor = descriptor
        self.action = action
    }

    public var body: some View {
        Button(
            action: action,
            label: {
                if isLoading {
                    ProgressView()
                        .frame(width: 30, height: 30)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blanco))
                } else {
                    HStack(spacing: 8) {
                        if let leftIcon = leftIcon {
                            Image(leftIcon)
                        }
                        if let title = title {
                            Text(title)
                        }
                        if let rightIcon = rightIcon {
                            Image(rightIcon)
                        }
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

struct WCUIButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WCUIButton(title: "Teste",
                       leftIcon: nil,
                       rightIcon: nil,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {})
            WCUIButton(title: "Teste",
                       leftIcon: nil,
                       rightIcon: nil,
                       style: .outline,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {})
        }
    }
}
