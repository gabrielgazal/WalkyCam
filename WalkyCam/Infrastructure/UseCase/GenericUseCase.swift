//
//  GenericUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import Foundation
import Combine

public struct GenericUseCase<Input, Output> {
    public typealias GenericUseCaseResult = AnyPublisher<Output, Error>
    private var execute: (Input) -> GenericUseCaseResult

    public init(execute: @escaping (Input) -> GenericUseCase<Input, Output>.GenericUseCaseResult) {
        self.execute = execute
    }

    public func callAsFunction(_ input: Input) -> GenericUseCaseResult {
        execute(input)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension GenericUseCase where Input == Void {
    public func callAsFunction() -> GenericUseCaseResult {
        execute(())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension GenericUseCase {
    static func `static`(_ output: Output) -> Self {
        Self { _ in
            Just(output)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }

    static var empty: Self {
        Self { _ in
            Empty(completeImmediately: false)
                .eraseToAnyPublisher()
        }
    }

    static func fail(error: Error = NSError(domain: "", code: -1)) -> Self {
        Self { _ in
            Fail(error: error)
                .eraseToAnyPublisher()
        }
    }

    static func notImplemented(error: Error = NSError(domain: "", code: -1)) -> Self {
        Self { _ in
            #if DEBUG
                fatalError()
            #else
                Fail(error: error)
                    .eraseToAnyPublisher()
            #endif
        }
    }
}
