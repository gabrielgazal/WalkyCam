//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class PlansService: PlansServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<PlansRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<PlansRouter>) {
        self.provider = provider
    }

    // MARK: - Public API

    func getAllPlans(completion: @escaping Completion) {
        provider.request(.getAllPlans,
                         completion: completion)
    }

    func getPlanById(id: String, completion: @escaping Completion) {
        provider.request(.getPlanById(id: id),
                         completion: completion)
    }
}
