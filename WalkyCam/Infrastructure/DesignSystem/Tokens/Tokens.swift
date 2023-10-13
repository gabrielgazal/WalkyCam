//
//  Tokens.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import Foundation
import UIKit

public struct Tokens {
    public struct Size {
        public struct Spacing {
            public static var tiny: CGFloat { return CGFloat(2.00) }
            public static var xsmall: CGFloat { return CGFloat(4.00) }
            public static var small: CGFloat { return CGFloat(8.00) }
            public static var regular: CGFloat { return CGFloat(16.00) }
            public static var large: CGFloat { return CGFloat(24.00) }
            public static var xlarge: CGFloat { return CGFloat(32.00) }
            public static var big: CGFloat { return CGFloat(40.00) }
            public static var huge: CGFloat { return CGFloat(64.00) }
            public static var giant: CGFloat { return CGFloat(96.00) }
        }

        public struct Font {
            public static var tiny: CGFloat { return CGFloat(10.00) }
            public static var xsmall: CGFloat { return CGFloat(12.00) }
            public static var small: CGFloat { return CGFloat(14.00) }
            public static var regular: CGFloat { return CGFloat(16.00) }
            public static var medium: CGFloat { return CGFloat(18.00) }
            public static var large: CGFloat { return CGFloat(20.00) }
            public static var xlarge: CGFloat { return CGFloat(24.00) }
            public static var big: CGFloat { return CGFloat(32.00) }
            public static var huge: CGFloat { return CGFloat(40.00) }
            public static var giant: CGFloat { return CGFloat(48.00) }
        }

        public struct Border {
            public struct Width {
                public static var hairline: CGFloat { return CGFloat(1.00) }
                public static var thin: CGFloat { return CGFloat(2.00) }
                public static var thick: CGFloat { return CGFloat(4.00) }
            }
            public struct Radius {
                public static var zero: CGFloat { return CGFloat(0.00) }
                public static var tiny: CGFloat { return CGFloat(2.00) }
                public static var xsmall: CGFloat { return CGFloat(4.00) }
                public static var small: CGFloat { return CGFloat(8.00) }
                public static var medium: CGFloat { return CGFloat(12.00) }
                public static var large: CGFloat { return CGFloat(16.00) }
            }
        }
    }
}
