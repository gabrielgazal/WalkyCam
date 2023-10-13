//
//  LinkButtonStyle.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

struct LinkButtonStyle: ButtonStyle {

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(getFont(isPressed: configuration.isPressed))
    }

    private func getFont(isPressed: Bool) -> Font {
        return isPressed ? .projectFont(size: 16, weight: .bold) : .projectFont(size: 16, weight: .regular)
    }
}
