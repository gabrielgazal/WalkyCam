//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct MockEntity: Codable, Hashable {
    public let id: Int
    public let joke: String
    public init(id: Int) {
        self.init(
            id: id,
            joke: ""
        )
    }
    
    public init(
        id: Int,
        joke: String
    ) {
        self.id = id
        self.joke = joke
    }
}
