//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

public protocol ParseHandler {
    func parse<Model: Decodable>(_ response: Response, at keyPath: String?) throws -> Model
}
