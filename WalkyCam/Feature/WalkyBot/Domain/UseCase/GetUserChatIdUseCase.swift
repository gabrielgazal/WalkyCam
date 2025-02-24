//
//  GetUserChatIdUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 13/02/25.
//

import Foundation
import Networking
import Combine
import MapKit

typealias GetUserChatIdUseCase = GenericUseCase<String, String>

extension GetUserChatIdUseCase {
    
    static func live(
        repository: AuthRepositoryProtocol
    ) -> Self {
        Self.init { userId in
            Deferred {
                Future { promise in
                    repository.getUserChatbotId(userId: userId) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(response.chatId))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
