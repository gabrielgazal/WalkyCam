//
//  SheetModifier.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

struct SheetModifier: ViewModifier {

    @Binding var presentingView: AnyView?

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: Binding(
                get: { self.presentingView != nil },
                set: { if !$0 {
                    self.presentingView = nil
                }})
            ) {
                self.presentingView
            }
    }
}
