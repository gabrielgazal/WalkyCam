//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya
import Combine

public final class ApiErrorHandler: ErrorHandler {
    // MARK: - Dependencies
    
    private let networkingEventsDispatcher: NetworkingEventsDispatching
    // MARK: - Initialization
    
    public init(networkingEventsDispatcher: NetworkingEventsDispatching = NetworkingEventsManager.shared) {
        self.networkingEventsDispatcher = networkingEventsDispatcher
    }
    
    // MARK: - Public API
    
    public func handleError(from response: Response) -> Error {
        let responseError: ResponseError
        
        do {
            responseError = try response.map(ResponseError.self)
        } catch {
            return error
        }
        
        
        /// Http status code by REST
        if response.statusCode == 401 {
            networkingEventsDispatcher.dispatchEvent(.invalidateSession)
            let error = UnauthorizedError(message: responseError.error)
            return error
        }
        
        let genericError = GenericError(message: responseError.error)
        return genericError
    }
}
