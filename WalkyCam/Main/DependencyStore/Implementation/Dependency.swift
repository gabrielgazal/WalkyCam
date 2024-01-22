//
//  Dependency.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 21/01/24.
//

@propertyWrapper
struct Dependency<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}

final class DependencyContainer {
    private var dependencies = [String: AnyObject]()
    private static var shared = DependencyContainer()
    
    static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }
    
    static func resolve<T>() -> T {
        shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }
    
    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T
        
        guard let dependency = dependency else {
            preconditionFailure("No dependency found for \(key)! must register a dependency before resolve.")
        }
        
        return dependency
    }
}
