//
//  ToastViewModifier.swift
//  ios-views
//
//  Created by Gabriel Gazal on 02/07/25.
//

import Foundation
import SwiftUI

public struct ToastViewModifier: ViewModifier {

    @Binding var toast: ToastModel?
    @State private var workItem: DispatchWorkItem?

    public func body(content: Content) -> some View {
        ZStack(alignment: toast?.direction.alignment ?? .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if let toast {
                ToastAlertView(
                    message: toast.message,
                    style: toast.style,
                    closable: toast.closable,
                    onDismiss: {
                        dismissToast()
                    }
                )
                .padding(Tokens.Size.Spacing.large)
                .transition(.move(edge: toast.direction.edge).combined(with: .opacity))
                .zIndex(.greatestFiniteMagnitude)
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: toast)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if toast?.direction == .bottom && value.translation.height > 50 {
                        dismissToast()
                    } else if toast?.direction == .top && value.translation.height < -50 {
                        dismissToast()
                    }
                }
        )
        .onChange(of: toast, perform: { toast in
            if let toast {
                scheduleToastDismissal(duration: toast.duration)
            }
        })
    }

    private func scheduleToastDismissal(duration: Double) {
        workItem?.cancel()

        let task = DispatchWorkItem {
            dismissToast()
        }

        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
    }

    private func dismissToast() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            toast = nil
        }

        workItem?.cancel()
        workItem = nil
    }
}

public extension View {
    func toastView(toast: Binding<ToastModel?>) -> some View {
        self.modifier(ToastViewModifier(toast: toast))
    }
}
