//
//  ChatResponse.swift
//
//
//  Created by Gabriel Gazal on 25/06/24.
//

import Foundation

public struct ChatResponse: Codable, Hashable {
    public let chatId: String
    public let type: String

    private enum CodingKeys: String, CodingKey {
        case chatId = "_id"
        case type
    }
}
