//
//  VideoCallOutput.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Foundation

public struct VideoCallOutput: Codable, Hashable {
    public let id: String
    public let type: String
    public let baseFunction: String
    public let date: String
    public let startTime: String
    public let endTime: String
    public let timeZone: String
    public let pixelationEnabled: Bool
    public let status: String
    
    public init(
        id: String,
        type: String,
        baseFunction: String,
        date: String,
        startTime: String,
        endTime: String,
        timeZone: String,
        pixelationEnabled: Bool,
        status: String
    ) {
        self.id = id
        self.type = type
        self.baseFunction = baseFunction
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.timeZone = timeZone
        self.pixelationEnabled = pixelationEnabled
        self.status = status
    }
}
