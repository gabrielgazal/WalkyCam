//
//  FunctionData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 26/10/23.
//

import Foundation

struct FunctionData: Hashable, Identifiable {
    let id: UUID = .init()
    let title: String
    let icon: String
}
