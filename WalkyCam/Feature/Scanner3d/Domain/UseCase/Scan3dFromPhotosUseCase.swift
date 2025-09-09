//
//  Scan3dFromPhotosUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 19/11/24.
//

import Foundation
import Networking
import Combine

typealias Scan3dFromPhotosUseCase = GenericUseCase<[String: Data], Void>

extension Scan3dFromPhotosUseCase {

    static func live(
        repository: TridimensionalModelRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    return repository.generateModelFromImages(
                        userId: getUserId(userSession: userSession),
                        images: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            do {
                                promise(.success(()))
                            } catch {
                                promise(.failure(error))
                            }
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
    
    private static func getUserId(userSession: UserSessionProtocol) -> String {
        let userid = try? userSession.user().id
        return userid ?? ""
    }
}
