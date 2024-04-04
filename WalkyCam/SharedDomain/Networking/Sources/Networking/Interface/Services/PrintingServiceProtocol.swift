//
//  PrintingServiceProtocol.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/04/24.
//

import Combine
import Moya
import Foundation

protocol PrintingServiceProtocol {
    func requestPrint(userId: String, file: Data, preview: String, completion: @escaping Completion)
    func getFileById(id: String, completion: @escaping Completion)
}
