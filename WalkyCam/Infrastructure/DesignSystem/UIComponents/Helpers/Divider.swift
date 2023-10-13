//
//  Divider.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 12/10/23.
//

import SwiftUI

public struct Divider: View {

    private let size: CGFloat = 1.0

    public init() {}

    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, minHeight: size, maxHeight: size)
            .foregroundColor(Color.plateado)
    }
}
