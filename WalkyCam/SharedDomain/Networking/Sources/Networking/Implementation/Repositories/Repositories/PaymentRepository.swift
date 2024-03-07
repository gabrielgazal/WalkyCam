//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

final class PaymentRepository: PaymentRepositoryProtocol {
    // MARK: - Dependencies

    private let service: PaymentServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: PaymentServiceProtocol = PaymentService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "user")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func createUserPayment(userid: String, completion: @escaping (CreateResult) -> Void) {
        service.createUserPayment(userId: userid) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
