//
//  PrintingService.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class PrintingService: PrintingServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<PrintingRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<PrintingRouter>) {
        self.provider = provider
    }

    // MARK: - Public API

    func requestPrint(userId: String, file: Data, preview: String, completion: @escaping Completion) {
        provider.request(.requestPrint(userId: userId, file: file, preview: preview),
                         completion: completion)
    }

    func getFileById(id: String, completion: @escaping Completion) {
        provider.request(.getFileById(id: id),
                         completion: completion)
    }
}
