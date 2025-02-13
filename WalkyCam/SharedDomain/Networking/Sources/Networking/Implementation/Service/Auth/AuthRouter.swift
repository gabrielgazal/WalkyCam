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
    case verifyByEmail(email: String, verificationCode: String)
    case updateInfo(userId: String, name: String?, lastName: String?, gender: String?, cellphone: String?, address: String?, additionalInfo: String?, birthdate: String?)
    case getUserFiles(userId: String)
    case getUserChatbotId(userId: String)
}

extension AuthRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .login:
            return "user/login"
        case .register:
            return "user/register"
        case let .verifyByEmail(email, verificationCode):
            return "user/verify-email/\(email)/\(verificationCode)"
        case .updateInfo:
            return "user/update"
        case let .getUserFiles(userId):
            return "user/get-files/\(userId)"
        case let .getUserChatbotId(userId):
            return "chat/get-walkybot-user-chat/\(userId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        case .verifyByEmail, .getUserFiles, .getUserChatbotId:
            return .get
        case .updateInfo:
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case let .login(userName, password):
            return getLogin(userName, password)
        case let .register(name, lastName, userName, email, password):
            return getRegister(name, lastName, userName, email, password)
        case .verifyByEmail:
            return verifyByEmail()
        case let .updateInfo(userId, name, lastName, gender, cellphone, address, additionalInfo, birthdate):
            return updateInfo(
                userId: userId,
                name: name,
                lastName: lastName,
                gender: gender,
                cellphone: cellphone,
                address: address,
                additionalInfo: additionalInfo,
                birthdate: birthdate
            )
        case .getUserFiles, .getUserChatbotId:
            return .requestPlain
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

    private func verifyByEmail() -> Task {
        return .requestPlain
    }
    
    private func updateInfo(userId: String, name: String?, lastName: String?, gender: String?, cellphone: String?, address: String?, additionalInfo: String?, birthdate: String?) -> Task {
        let parameters = [
            "id_user": userId,
            "name": name ?? "",
            "last_name": lastName ?? "",
            "gender": gender ?? "",
            "cellphone_number": cellphone ?? "",
            "address": address ?? "",
            "about_me": additionalInfo ?? "",
            "birth_date": birthdate ?? ""
        ] as [String:Any]
        
        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
