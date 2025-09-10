//
//  ToastModel.swift
//
//  Created by Gabriel Gazal on 02/07/25.
//

import Foundation
import SwiftUI

public enum ToastDirection {
    case bottom, top
}

public struct ToastModel: Equatable {
    var style: ToastAlertStyle
    var message: String
    var duration: Double
    var direction: ToastDirection
    var closable: Bool

    public init(
        style: ToastAlertStyle,
        message: String,
        duration: Double = 3.0,
        direction: ToastDirection = .bottom,
        closable: Bool = false
    ) {
        self.style = style
        self.message = message
        self.duration = duration
        self.direction = direction
        self.closable = closable
    }
}

public extension ToastDirection {
    var alignment: Alignment {
        switch self {
        case .bottom:
            return .bottom
        case .top:
            return .top
        }
    }
    
    var edge: Edge {
        switch self {
        case .bottom:
            return .bottom
        case .top:
            return .top
        }
    }
}
