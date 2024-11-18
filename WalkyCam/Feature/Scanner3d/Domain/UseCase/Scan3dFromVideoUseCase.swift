//
//  Scan3dFromVideoUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/11/24.
//

import Foundation
import Networking
import Combine

typealias Scan3dFromVideoUseCase = GenericUseCase<Data, Void>

extension Scan3dFromVideoUseCase {

    static func live(
        repository: TridimensionalModelRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    return repository.generateModelFromVideo(
                        userId: getUserId(userSession: userSession),
                        video: input) { result in
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
