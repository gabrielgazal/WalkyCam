//
//  SelectorModel.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import Foundation

public struct SelectorModel: Identifiable, Equatable, SelectorItem {
    public let id = UUID()
    var key: String
    var value: String
    public var isSelected: Bool = false
    var disabled: Bool = false

    init(value: String,
         isSelected: Bool = false,
         disabled: Bool = false) {
        self.value = value
        self.key = value
        self.isSelected = isSelected
        self.disabled = disabled
    }

    init(key: String,
         value: String,
         isSelected: Bool = false,
         disabled: Bool = false) {
        self.key = key
        self.value = value
        self.isSelected = isSelected
        self.disabled = disabled
    }
}

public protocol SelectorItem {
    var isSelected: Bool { get set }
}
