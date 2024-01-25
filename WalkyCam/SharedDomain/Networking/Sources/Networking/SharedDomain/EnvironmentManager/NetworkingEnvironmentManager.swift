//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

/// Defines a single instance for the EnvironmentProvider
/// NOTE: Simplified implementation, that could be extendend.
public final class NetworkingEnvironmentManager: NetworkingEnvironmentManagerProtocol {
    // MARK: - Singleton

    public static let shared = NetworkingEnvironmentManager()

    public func configure() {}

    /// Defines the current enviroment
    public var currentEnvironment: APIEnvironment { getServicesEnvironment() }

    /// Provides de base URL for the services
    public var baseURL: URL {
        switch currentEnvironment {
        case .production, .debug:
            return URL(string: "https://www.walkycam.com/api/v1/user")!
        }
    }

    // MARK: - Initialization

    init() {}

    // MARK: - Public API

    func getServicesEnvironment() -> APIEnvironment {
#if DEBUG
        return .debug
#else
        return .production
#endif
    }
}
