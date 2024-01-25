//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya
import Combine

public protocol ErrorHandler {
    func handleError(from response: Response) -> Error
}
