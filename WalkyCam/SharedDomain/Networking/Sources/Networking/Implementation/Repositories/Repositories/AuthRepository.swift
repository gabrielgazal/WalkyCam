//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya

final class AuthRepository: AuthRepositoryProtocol {
    // MARK: - Dependencies

    private let service: AuthServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: AuthServiceProtocol = AuthService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "user")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func login(userName: String, password: String, completion: @escaping (LoginResult) -> Void) {
        service.login(userName: userName, password: password) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping (RegisterResult) -> Void) {
        service.register(name: name,
                         lastName: lastName,
                         userName: userName,
                         email: email,
                         password: password) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func verifyByEmail(email: String, verificationCode: String, completion: @escaping (VerifyByEmailResult) -> Void) {
        service.verifyByEmail(email: email, verificationCode: verificationCode) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func getUserPlan(userName: String, password: String, completion: @escaping (UserPlanResponse) -> Void) {
        service.login(userName: userName, password: password) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "user_plan")))
        }
    }
    
    func updateInfo(
        userId: String,
        name: String?,
        lastName: String?,
        gender: String?,
        cellphone: String?,
        address: String?,
        additionalInfo: String?,
        birthdate: String?,
        completion: @escaping (UpdateUserInfoResponse) -> Void
    ) {
        service.updateInfo(
            userId: userId,
            name: name,
            lastName: lastName,
            gender: gender,
            cellphone: cellphone,
            address: address,
            additionalInfo: additionalInfo,
            birthdate: birthdate) { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
    }
    
    func getUserFiles(userId: String, completion: @escaping (GetUserFilesResponse) -> Void) {
        service.getUserFiles(
            userId: userId) { result in
                completion(result.mapToRepositoryResult(with:  DefaultRequestHandler(at: "files")))
            }
    }
    
    func getUserChatbotId(userId: String, completion: @escaping (GetUserChatbotIdResponse) -> Void) {
        service.getUserChatbotId(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "chat")))
        }
    }
    
    func resetPassword(email: String, completion: @escaping (ResetPasswordResponse) -> Void) {
        service.resetPassword(email: email) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler()))
        }
    }
}
