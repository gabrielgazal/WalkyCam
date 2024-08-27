//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine

public protocol AuthRepositoryProtocol {
    typealias LoginResult = Result<UserResponse, RepositoryError>
    typealias RegisterResult = Result<UserResponse, RepositoryError>
    typealias VerifyByEmailResult = Result<UserResponse, RepositoryError>
    typealias UserPlanResponse = Result<PlanResponse, RepositoryError>
    typealias UpdateUserInfoResponse = Result<UserResponse, RepositoryError>
    typealias GetUserFilesResponse = Result<String, RepositoryError>

    func login(userName: String,
               password: String,
               completion: @escaping (LoginResult) -> Void)
    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping (RegisterResult) -> Void)
    func verifyByEmail(email: String,
                       verificationCode: String,
                       completion: @escaping (VerifyByEmailResult) -> Void)
    func getUserPlan(userName: String,
                     password: String,
                     completion: @escaping (UserPlanResponse) -> Void)
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
    )
    func getUserFiles(
        userId: String,
        completion: @escaping (GetUserFilesResponse) -> Void
    )
}
