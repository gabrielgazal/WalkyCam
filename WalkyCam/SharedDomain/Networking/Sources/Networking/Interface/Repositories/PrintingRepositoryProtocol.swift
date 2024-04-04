//
//  PrintingRepositoryProtocol.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/04/24.
//

import Combine
import Foundation

public protocol PrintingRepositoryProtocol {
    typealias RequestPrintResult = Result<String, RepositoryError>
    typealias GetFileByIdResult = Result<Void, RepositoryError>

    func requestPrint(userId: String, file: Data, preview: String, completion: @escaping (RequestPrintResult) -> Void)
    func getFileById(id: String, completion: @escaping (GetFileByIdResult) -> Void)
}
