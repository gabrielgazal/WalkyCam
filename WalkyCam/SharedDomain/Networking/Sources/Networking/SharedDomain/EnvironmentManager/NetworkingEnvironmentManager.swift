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
    
    // MARK: - Constants
    
    
    // MARK: - Dependencies
    
    
    // MARK: - Public Properties
    
    /// TODO: Pass the URLs from secrets here
    public func configure() {
        
    }
    
    /// Defines the current enviroment
    public var currentEnvironment: APIEnvironment { getServicesEnvironment() }
    
    /// Provides de base URL for the services
    public var baseURL: URL {
        switch currentEnvironment {
        case .production, .debug:
            return URL(string: "http://www.walkycam.com/api")!
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