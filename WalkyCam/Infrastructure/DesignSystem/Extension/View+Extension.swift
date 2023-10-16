//
//  View+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = true) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }

    func withoutAnimation(action: @escaping () -> Void) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
            action()
        }
    }

    func context(size: CGFloat,
                 weight: ProjectFontWeight = .regular) -> some View {
        font(.projectFont(size: size, weight: weight))
    }

    func alert<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        return modifier(
            AlertModifier(
                isPresented: isPresented,
                alertBody: content
            )
        )
    }

    func fullScreen<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        return modifier(
            FullScreenModifier(
                isPresented: isPresented,
                contentBody: content
            )
        )
    }
}
