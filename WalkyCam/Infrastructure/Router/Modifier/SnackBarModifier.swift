//
//  SnackBarModifier.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

struct SnackbarViewModifier: ViewModifier {
    @Binding var presentingView: AnyView?

    private var isPresented: Binding<Bool> {
        Binding(
            get: { self.presentingView != nil },
            set: { if !$0 {
                self.presentingView = nil
            }})
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented.wrappedValue {
                presentingView
                    .onTapGesture {
                        presentingView = nil
                    }
            }
        }
    }
}
