//
//  Text+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 12/10/23.
//

import Foundation
import SwiftUI

public extension Text {
    func context(size: CGFloat,
                 weight: ProjectFontWeight = .regular) -> Text {
        font(.projectFont(size: size, weight: weight))
    }
}
