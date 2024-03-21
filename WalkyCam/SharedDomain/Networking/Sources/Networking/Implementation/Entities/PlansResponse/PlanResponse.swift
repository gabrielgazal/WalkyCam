//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Foundation

public struct PlanResponse: Codable, Hashable {
    public let id: String
    public let name: String
    public let monthlyPrice: String
    public let yearlyPrice: String
    public let order: String
    public let monthlyPlanAvailable: Bool
    public let yearlyPlanAvailable: Bool

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case monthlyPrice = "eur_price_monthly"
        case yearlyPrice = "eur_price_yearly"
        case monthlyPlanAvailable = "monthly_plan_available"
        case yearlyPlanAvailable = "yearly_plan_available"
        case name, order
    }
}
