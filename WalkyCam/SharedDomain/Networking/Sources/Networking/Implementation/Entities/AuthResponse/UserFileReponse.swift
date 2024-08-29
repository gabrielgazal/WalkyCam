//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 26/08/24.
//

import Foundation

public struct UserFileReponse: Codable, Hashable {
    public let id: String
    public let type: String
    public let tag: String
    public let status: String
    public let basePath: String?
    public let viewPath: String?
    public let path: String?
    public let creationDate: String

    private enum CodingKeys: String, CodingKey {
        case type, tag, status, path
        case id = "_id"
        case basePath = "base_path"
        case viewPath = "view_path"
        case creationDate = "created_at"
    }
}
