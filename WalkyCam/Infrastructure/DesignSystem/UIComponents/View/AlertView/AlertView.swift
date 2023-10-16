//
//  AlertView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

public struct AlertView<Content: View>: View {
    // MARK: - Contants

    private struct ViewMetrics {
        let backgroundOpacity: CGFloat = 0.8
    }

    // MARK: - Dependencies

    private let viewMetrics: ViewMetrics = .init()
    private let title: String?
    private let subtitle: String
    private let content: Content
    private let dismiss: (() -> Void)?
    @State var animate: Bool = false
    private var isRunningTests = (NSClassFromString("XCTest") != nil)

    // MARK: - Initialization

    public init(
        title: String?,
        subtitle: String,
        @ViewBuilder content: () -> Content,
        dismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.dismiss = dismiss
        self.content = content()
    }

    // MARK: - UIView Body

    public var body: some View {
        ZStack {
            Color.negro
            .opacity(viewMetrics.backgroundOpacity)
            .ignoresSafeArea()
            Group {
                VStack(alignment: .leading, spacing: Tokens.Size.Spacing.regular) {
                    if let title = title {
                        Text(title)
                            .font(.projectFont(size: Tokens.Size.Font.large,
                                               weight: .semibold))
                            .foregroundColor(Color.blanco)
                            .multilineTextAlignment(.center)
                    }
                    Text(subtitle)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                        .foregroundColor(Color.blanco)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: Tokens.Size.Spacing.small)
                    content
                }
                .padding(Tokens.Size.Spacing.large)
                .background(
                    RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.large)
                        .fill(Color.negro.opacity(0.7))
                )
            }
            .padding(.horizontal, Tokens.Size.Spacing.xlarge)
        }
        .opacity(animate ? 1.0 : 0.0)
        .onAppear {
            if isRunningTests {
                animate.toggle()
                return
            }
            withAnimation {
                animate.toggle()
            }
        }
    }
}
