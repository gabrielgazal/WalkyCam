//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum AuthRouter {
    case login(userName: String, password: String)
    case register(name: String, lastName: String, userName: String, email: String, password: String)
}

extension AuthRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .register:
            return "/register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .login(userName, password):
            return getLogin(userName, password)
        case let .register(name, lastName, userName, email, password):
            return getRegister(name, lastName, userName, email, password)
        }
    }
    
    // MARK: - Private Methods
    
    private func getLogin(_ userName: String, _ password: String) -> Task {
        let parameters = [
            "user": userName,
            "password": password
        ] as [String:Any]
        
        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
    
    private func getRegister(_ name: String, _ lastName: String, _ userName: String, _ email: String, _ password: String) -> Task {
        let parameters = [
            "name": name,
            "last_name": lastName,
            "user_name": userName,
            "email": email,
            "password": password
        ] as [String:Any]
        
        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
