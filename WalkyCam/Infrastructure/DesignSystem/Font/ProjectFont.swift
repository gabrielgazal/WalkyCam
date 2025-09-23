//
//  ProjectFont.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

// swiftlint:disable all

public enum ProjectFontWeight {
    case black, bold, semibold, medium, regular, light, thin
}
// swiftlint:enable line_length

// swiftlint:disable cyclomatic_complexity
extension Font {
    public static func projectFont(
        size: CGFloat,
        weight: ProjectFontWeight = .regular
    ) -> Font {
        var fontNameToReturn: String = "Mulish-Regular"
        switch weight {
        case .black:
            fontNameToReturn = "Mulish-Black"
        case .bold:
            fontNameToReturn = "Mulish-Bold"
        case .medium, .semibold:
            fontNameToReturn = "Mulish-Medium"
        case .regular:
            fontNameToReturn = "Mulish-Regular"
        case .light:
            fontNameToReturn = "Mulish-Light"
        case .thin:
            fontNameToReturn = "Mulish-ExtraLight"
        }
        return Font.custom(fontNameToReturn, fixedSize: size)
    }
}
// swiftlint:enable cyclomatic_complexity
