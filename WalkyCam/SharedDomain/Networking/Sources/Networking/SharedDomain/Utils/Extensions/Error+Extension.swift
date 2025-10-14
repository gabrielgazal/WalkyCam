//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

import Foundation
import Moya

extension Error {

    func toRepositoryError() -> RepositoryError {

        if let repositoryError = self as? RepositoryError {
            return repositoryError
        } else if let unauthorizedError = self as? UnauthorizedError {
            return .init(
                status: .unauthorized,
                message: unauthorizedError.message
            )
        } else if let genericError = self as? GenericError {
            return .init(
                status: .generic,
                message: genericError.message
            )
        } else if let responseError = self as? ResponseError {
            return .init(
                status: .code(responseError.status ?? -1),
                message: responseError.error
            )
        } else if let moyaError = self as? MoyaError {
            if case .objectMapping(_, let response) = moyaError {
                if let json = try? JSONSerialization.jsonObject(with: response.data) as? [String: Any],
                   let message = json["response_message"] as? String {
                    
                    return .init(
                        status: .code(response.statusCode),
                        message: message.capitalized
                    )
                }
            }
            
            return .init(
                status: .unexpected,
                message: moyaError.localizedDescription
            )
        } else {
            return .init(
                status: .unexpected,
                message: "No pude procesar tu solicitud... ¡Espera unos minutos y podrás volver a intentarlo!"
            )
        }
    }
}
