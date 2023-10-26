//
//  RepositoryProvider.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import Foundation

public typealias RepositoryFactory = () -> AnyObject

protocol RepositoryRegistering {
    /// Resolves the instance for especified type of repository
    /// - Parameters:
    ///    - respositoryFactory: the concrete instance factory
    ///    - type: the interface
    func register<T>(_ respositoryFactory: @escaping RepositoryFactory, forType type: T.Type) throws
}

public final class RepositoryProvider: RepositoryRegistering, RepositoryResolving {

    // MARK: - Singleton

    public static let shared = RepositoryProvider()

    // MARK: - Dependencies

    private let dependencyStore: DependencyContainerInterface

    // MARK: - Initialization

    init(dependencyContainer: DependencyContainerInterface? = nil) {
        self.dependencyStore = dependencyContainer ?? DependencyContainer()
    }

    convenience init() {
        self.init(dependencyContainer: DependencyContainer())
        registerDefaultRespositories()
    }

    // MARK: - RepositoryStoring

    func register<T>(_ respositoryFactory: @escaping RepositoryFactory, forType type: T.Type) throws {
        dependencyStore.register(respositoryFactory, forMetaType: type)
    }

    // MARK: - RepositoryResolving

    public func resolve<T>(_ type: T.Type) -> T {
        guard let instance = dependencyStore.get(type) else {
            fatalError("This happened because \(String(describing: type)) is not registered.")
        }
        return instance
    }

    private func registerDefaultRespositories() {
//        let clientRepositoryFactory = { ClientRepository(service: ClientService()) }
//
//        try? register(clientRepositoryFactory, forType: ClientRepositoryProtocol.self)
    }
}
