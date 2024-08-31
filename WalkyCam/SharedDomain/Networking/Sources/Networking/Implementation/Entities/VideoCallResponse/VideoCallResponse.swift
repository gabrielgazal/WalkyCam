//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Foundation

public struct VideoCallResponse: Codable, Hashable {
    public let id: String
    public let type: String
    public let baseFunction: String
    public let date: String?
    public let startTime: String
    public let endTime: String
    public let timeZone: String
    public let pixelationEnabled: Bool
    public let status: String?

    private enum CodingKeys: String, CodingKey {
        case type, date, status
        case id = "_id"
        case baseFunction = "base_function"
        case startTime = "start_time"
        case endTime = "end_time"
        case timeZone = "time_zone"
        case pixelationEnabled = "pixelation_face_enabled"
    }
}
