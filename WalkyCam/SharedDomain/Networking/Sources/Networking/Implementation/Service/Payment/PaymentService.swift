//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class PaymentService: PaymentServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<PaymentRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<PaymentRouter>) {
        self.provider = provider
    }

    // MARK: - Public API

    func createUserPayment(userId: String, completion: @escaping Completion) {
        provider.request(.createUserPayment(userId: userId),
                         completion: completion)
    }
}
