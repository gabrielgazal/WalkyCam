//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Alamofire
import Foundation
import Moya

class DefaultAlamofireSession: Alamofire.Session {
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 12
        configuration.timeoutIntervalForResource = 12
        return DefaultAlamofireSession(configuration: configuration)
    }()
}

public extension MoyaProvider {
    static var `default`: MoyaProvider<Target> {
        .with(
            plugins: NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
            sessionManager: DefaultAlamofireSession.shared
        )
    }
    
    static func with(plugins: PluginType..., sessionManager: Alamofire.Session) -> MoyaProvider<Target> {
        MoyaProvider<Target>(
            session: sessionManager,
            plugins: plugins
        )
    }
}
