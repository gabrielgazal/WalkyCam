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
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func applyShadow() -> some View {
        return self.shadow(
            color: Color.negro.opacity(0.1),
            radius: 10,
            x: 0,
            y: 2
        )
    }
}

extension View {
    @ViewBuilder
    func forceRotation(orientation: UIInterfaceOrientationMask) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.onAppear() {
                AppDelegate.orientationLock = orientation
            }
            let currentOrientation = AppDelegate.orientationLock
            self.onDisappear() {
                AppDelegate.orientationLock = currentOrientation
            }
        } else {
            self
        }
    }
}
