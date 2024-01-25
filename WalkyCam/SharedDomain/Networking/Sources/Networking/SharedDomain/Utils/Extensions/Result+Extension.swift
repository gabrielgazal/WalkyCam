//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

import Moya
import Foundation

extension Result where Success: Moya.Response, Failure == MoyaError {

    func mapToRepositoryResult<Model: Decodable>(with requestHandler: RequestHandler) -> Result<Model, RepositoryError> {

        return flatMap { response in
            do {
                return .success(try requestHandler.handle(response: response))
            } catch let error {
                return .failure(.objectMapping(error, response))
            }
        }.mapError {
            $0.toRepositoryError()
        }
    }

    func mapToRepositoryResult(with requestHandler: RequestHandler) -> Result<Void, RepositoryError> {

        return flatMap { response in
            do {
                return .success(try requestHandler.handleVoid(response: response))
            } catch let error {
                return .failure(.objectMapping(error, response))
            }
        }.mapError {
            $0.toRepositoryError()
        }
    }
}

extension Result {
    func toVoidRepositoryResult() -> Result<(), Error> {
        switch self {
        case .success:
            return .success(())
        case let .failure(error):
            return .failure(error.toRepositoryError())
        }
    }
}
