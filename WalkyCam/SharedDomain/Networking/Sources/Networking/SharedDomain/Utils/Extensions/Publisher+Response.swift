//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Foundation
import Moya

public extension AnyPublisher where Output == Response, Failure == MoyaError {
    func handle<Model: Decodable>(by handler: RequestHandler = DefaultRequestHandler()) -> AnyPublisher<Model, RepositoryError> {
        tryMap {
            try handler.handle(response: $0)
        }
        .mapError {
            parseNetworkError($0)
        }
        .eraseToAnyPublisher()
    }
    
    func handle(
        by handler: RequestHandler = DefaultRequestHandler()
    ) -> AnyPublisher<Void, RepositoryError> {
        tryMap {
            try handler.handleVoid(response: $0)
        }
        .mapError {
            parseNetworkError($0)
        }
        .eraseToAnyPublisher()
    }
    
    private func parseNetworkError(_ rawError: Error) -> RepositoryError {
        if let repositoryError = rawError as? RepositoryError {
            return repositoryError
        } else if let unauthorizedError = rawError as? UnauthorizedError {
            return .init(
                status: .unauthorized,
                message: unauthorizedError.message
            )
        } else if let genericError = rawError as? GenericError {
            return .init(
                status: .generic,
                message: genericError.message
            )
        } else if let responseError = rawError as? ResponseError {
            return .init(
                status: .code(responseError.status ?? -1),
                message: responseError.error
            )
        } else {
            return .init(
                status: .unexpected,
                message: "Não consegui processar sua solicitação... Aguarde alguns minutos e pode tentar novamente!"
            )
        }
    }
}
