//
//  FlippedUpsideDown.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Foundation
import SwiftUI

struct FlippedUpsideDown: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(180))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}

extension View {
    func flippedUpsideDown() -> some View {
        self.modifier(FlippedUpsideDown())
    }
}
