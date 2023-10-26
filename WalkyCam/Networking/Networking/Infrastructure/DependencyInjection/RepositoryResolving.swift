//
//  RepositoryResolving.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import Foundation

/// Markup  protocol to constrain a repository
public protocol Repository {}

/// Markup  protocol to constrain an instantiable repository
public protocol InstantiableRepository: Repository {}

public protocol RepositoryResolving {
    /// Resolves the instance for especified type of repository
    /// - Parameter type: the repository type you need an instance of
    /// - Returns: an instance for the especified repository
    func resolve<T>(_ type: T.Type) -> T
}
