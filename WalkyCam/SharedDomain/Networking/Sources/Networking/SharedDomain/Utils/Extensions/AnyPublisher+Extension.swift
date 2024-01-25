//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Combine

public extension AnyPublisher {
    
    func handle(_ callback: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return self.sink { event in
            if case let .failure(error) = event {
                callback(.failure(error))
            }
        } receiveValue: { value in
            callback(.success(value))
        }
    }
}
