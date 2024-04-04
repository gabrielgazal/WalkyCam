//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum PrintingRouter {
    case requestPrint(userId: String, file: Data, preview: String)
    case getFileById(id: String)
}

extension PrintingRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .requestPrint:
            return "print/request-3d-print"
        case let .getFileById(id):
            return "file/get-3d-file/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .requestPrint:
            return .post
        case .getFileById:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .requestPrint(userId, file, preview):
            return requestPrint(userId: userId, file: file, preview: preview)
        case .getFileById:
            return .requestPlain
        }
    }

    private func requestPrint(userId: String, file: Data, preview: String) -> Task {
        let parameters = [
            "id_user": userId,
            "file": file,
            "preview_file": preview
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
