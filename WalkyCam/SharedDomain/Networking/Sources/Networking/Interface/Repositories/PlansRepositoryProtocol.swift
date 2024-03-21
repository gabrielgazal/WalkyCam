//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Combine

public protocol PlansRepositoryProtocol {
    typealias GetAllResult = Result<[PlanResponse], RepositoryError>
    typealias GetPlanByIdResult = Result<PlanResponse, RepositoryError>

    func getAllPlans(completion: @escaping (GetAllResult) -> Void)
    func getPlanById(id: String,
                     completion: @escaping (GetPlanByIdResult) -> Void)
}
