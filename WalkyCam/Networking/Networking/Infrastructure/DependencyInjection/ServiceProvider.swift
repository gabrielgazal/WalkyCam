//
//  ServiceProvider.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import Foundation

public protocol ServiceResolving {
    func resolve<T>(_ type: T.Type) -> T
}
