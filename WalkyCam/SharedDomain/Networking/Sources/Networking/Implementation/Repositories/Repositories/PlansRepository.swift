//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya

final class PlansRepository: PlansRepositoryProtocol {
    // MARK: - Dependencies

    private let service: PlansServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: PlansServiceProtocol = PlansService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "plans")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func getAllPlans(completion: @escaping (GetAllResult) -> Void) {
        service.getAllPlans { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getPlanById(id: String, completion: @escaping (GetPlanByIdResult) -> Void) {
        service.getPlanById(id: id) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "plan")))
        }
    }
}
