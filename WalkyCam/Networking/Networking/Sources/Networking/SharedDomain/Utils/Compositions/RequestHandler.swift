//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya
import Combine

public protocol RequestHandler {
    func handle<Model: Decodable>(response: Response) throws -> Model
    func handleVoid(response: Response) throws
    var successStatusRange: ClosedRange<Int> { get }
}
