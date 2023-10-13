//
//  ButtonStyleDescriptor.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

enum ButtonStyles {
    case standard,
         outline
}

protocol ButtonStyleDescriptorProtocol {
    var mainColor: Color { get }
    var pressedColor: Color { get }
}

struct OrangeButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .naranja
    }
    var pressedColor: Color {
        return .naranja
    }
}

struct BlackButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .negro
    }
    var pressedColor: Color {
        return .negro
    }
}
struct WhiteButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .blanco
    }
    var pressedColor: Color {
        return .blanco
    }
}
