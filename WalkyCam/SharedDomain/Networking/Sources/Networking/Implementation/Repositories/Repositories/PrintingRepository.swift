//
//  PrintingRepository.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Foundation
import Moya

final class PrintingRepository: PrintingRepositoryProtocol {
    // MARK: - Dependencies

    private let service: PrintingServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: PrintingServiceProtocol = PrintingService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler()
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func requestPrint(userId: String, file: Data, preview: String, completion: @escaping (RequestPrintResult) -> Void) {
        service.requestPrint(userId: userId, file: file, preview: preview) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getFileById(id: String, completion: @escaping (GetFileByIdResult) -> Void) {
        service.getFileById(id: id) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
