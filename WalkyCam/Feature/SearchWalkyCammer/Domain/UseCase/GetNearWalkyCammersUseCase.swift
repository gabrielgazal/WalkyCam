//
//  GetNearWalkyCammersUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 21/12/24.
//

import Foundation
import Networking
import Combine

typealias GetNearWalkyCammersUseCase = GenericUseCase<String, [CammerData]>

extension GetNearWalkyCammersUseCase {
    
    static func live(
        repository: WalkcamerRepositoryProtocol
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.getNearWalkcammers { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(response.map { mapResponseToCammerData($0) }))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    static func mapResponseToCammerData(_ input: WalkyCammersResponse) -> CammerData {
        return .init(
            id: Int(input.id) ?? -1,
            name: "\(input.name) \(input.lastName)",
            stars: 5,
            description: "",
            about: "",
            profileImage: "",
            technologies: [],
            coordinates: .init(),
            devices: [],
            availability: .none,
            abilities: []
        )
    }
}
