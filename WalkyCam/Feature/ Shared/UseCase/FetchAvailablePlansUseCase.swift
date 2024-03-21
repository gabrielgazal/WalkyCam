//
//  FetchAvailablePlansUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Foundation
import Networking
import Combine
import SwiftUI

typealias FetchAvailablePlansUseCase = GenericUseCase<Void, [AvailablePlanData]>

extension FetchAvailablePlansUseCase {
    static func live(
        repository: PlansRepositoryProtocol
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.getAllPlans { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(mapResponseToResult(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func mapResponseToResult(_ data: [PlanResponse]) -> [AvailablePlanData] {
        data.map { item in
            return .init(id: item.id,
                         name: item.name,
                         monthlyPrice: item.monthlyPrice,
                         color: Color(item.name),
                         order: Int(item.order) ?? 0)
        }
    }
}
