//
//  Route.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

protocol Route {
    var isPresented: Binding<Bool> {get set}
    func build() -> AnyView
}
