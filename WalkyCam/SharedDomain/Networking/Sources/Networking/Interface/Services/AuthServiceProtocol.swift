//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya
import Foundation

protocol AuthServiceProtocol {
    func login(userName: String,
               password: String,
               completion: @escaping Completion)
    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping Completion)
    func verifyByEmail(email: String,
                       verificationCode: String,
                       completion: @escaping Completion)
    func updateInfo(
        userId: String,
        name: String?,
        lastName: String?,
        gender: String?,
        cellphone: String?,
        address: String?,
        additionalInfo: String?,
        birthdate: String?,
        completion: @escaping Completion
    )
    
    func getUserFiles(
        userId: String,
        completion: @escaping Completion
    )
    
    func getUserChatbotId(
        userId: String,
        completion: @escaping Completion
    )
}
