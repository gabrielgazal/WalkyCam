//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

/// Defines de current application environment
public enum APIEnvironment: RawRepresentable {
    public init?(rawValue: String) {
        switch rawValue {
        case "debug":
            self = .debug
        case "production":
            self = .production
        default:
            return nil
        }
    }
    
    public typealias RawValue = String
    
    case debug
    case production
    
    public var rawValue: String {
        switch self {
        case .debug:
            return "debug"
        case .production:
            return "production"
        }
    }
}

/// Provides an interface for the services enviroment properties
public protocol NetworkingEnvironmentProviding {
    /// Defines the current enviroment
    var currentEnvironment: APIEnvironment { get }
    /// Provides de base URL for the services
    var baseURL: URL { get }
}

public protocol NetworkingEnvironmentManaging {
    /// TODO Later: Updates the current environment
}

public protocol NetworkingEnvironmentManagerProtocol: NetworkingEnvironmentProviding, NetworkingEnvironmentManaging {}
