//
//  WCToggle.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import SwiftUI

struct WCToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
            Spacer()
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? Color.naranja : Color.blancoGris)
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(-5)
                        .offset(x: configuration.isOn ? 10 : -10)
                }
                .frame(width: 50, height: 12)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
        .shadow(
            color: .black.opacity(0.2),
            radius: 8,
            x: 0,
            y: 2
        )
    }
}

struct WCToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello")
            Toggle(isOn: .constant(false)) {
                Text("Toggle Test")
            }
            .toggleStyle(WCToggleStyle())
            Toggle(isOn: .constant(true)) {
                Text( "Toggle Test")
            }
            .toggleStyle(WCToggleStyle())
        }
    }
}