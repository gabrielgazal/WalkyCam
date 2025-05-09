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
struct ClearButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .clear
    }
    var pressedColor: Color {
        return .clear
    }
}
struct YellowButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .premium
    }
    var pressedColor: Color {
        return .premium
    }
}
struct GreyButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .plateado
    }
    var pressedColor: Color {
        return .plateado
    }
}
struct BlueButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    var mainColor: Color {
        return .acentoFondoDark
    }
    var pressedColor: Color {
        return .acentoFondoDark
    }
}
struct PlanButtonStyleDescriptor: ButtonStyleDescriptorProtocol {
    
    var planName: String
    
    public init(planName: String) {
        self.planName = planName
    }
    
    var mainColor: Color {
        return Color(planName)
    }
    var pressedColor: Color {
        return Color(planName).opacity(0.5)
    }
}
