//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
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
        let authRepositoryFactory = { AuthRepository(service: AuthService()) }
        let configurationRepositoryFactory = { ConfigurationRepository(service: ConfigurationService()) }
        let plansRepositoryFactory = { PlansRepository(service: PlansService()) }
        let paymentRepositoryFactory = { PaymentRepository(service: PaymentService()) }
        let subscriptionRepositoryFactory = { SubscriptionRepository(service: SubscriptionService()) }
        let streetcamRepositoryFactory = { StreetcamRepository(service: StreetcamService()) }
        let videoCallRepositoryFactory = { VideoCallRepository(service: VideoCallService()) }
        let scan3dRepositoryFactory = { Scan3DRepository(service: Scan3DService()) }
        let tridimensionalModelFactory = { TridimensionalModelRepository(service: TridimensionalModelService())}
        let walkcamerRepositoryFactory = { WalkcamerRepository(service: WalkcamerService()) }

        try? register(authRepositoryFactory, forType: AuthRepositoryProtocol.self)
        try? register(configurationRepositoryFactory, forType: ConfigurationRepositoryProtocol.self)
        try? register(plansRepositoryFactory, forType: PlansRepositoryProtocol.self)
        try? register(paymentRepositoryFactory, forType: PaymentRepositoryProtocol.self)
        try? register(subscriptionRepositoryFactory, forType: SubscriptionRepositoryProtocol.self)
        try? register(streetcamRepositoryFactory, forType: StreetcamRepositoryProtocol.self)
        try? register(videoCallRepositoryFactory, forType: VideoCallRepositoryProtocol.self)
        try? register(scan3dRepositoryFactory, forType: Scan3DRepositoryProtocol.self)
        try? register(tridimensionalModelFactory, forType: TridimensionalModelRepositoryProtocol.self)
        try? register(walkcamerRepositoryFactory, forType: WalkcamerRepositoryProtocol.self)
    }
}


