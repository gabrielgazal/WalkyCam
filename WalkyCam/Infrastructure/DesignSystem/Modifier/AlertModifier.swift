//
//  AlertModifier.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//
import SwiftUI

struct AlertModifier<AlertBody: View> {

    @Binding private var isPresented: Bool

    private var alertBody: () -> AlertBody

    public init(
        isPresented: Binding<Bool>,
        @ViewBuilder alertBody: @escaping () -> AlertBody
    ) {
        self._isPresented = isPresented
        self.alertBody = alertBody
    }
}

extension AlertModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fullScreen(isPresented: $isPresented, content: alertBody)
    }
}
