//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public protocol ServiceResolving {
    func resolve<T>(_ type: T.Type) -> T
}
