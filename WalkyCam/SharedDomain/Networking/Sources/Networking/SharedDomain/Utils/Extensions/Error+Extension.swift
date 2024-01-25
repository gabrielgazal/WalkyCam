//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

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
        } else {
            return .init(
                status: .unexpected,
                message: "Não consegui processar sua solicitação... Aguarde alguns minutos e pode tentar novamente!"
            )
        }
    }
}
