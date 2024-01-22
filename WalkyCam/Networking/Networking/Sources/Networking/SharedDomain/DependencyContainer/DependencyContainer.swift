//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

typealias DependencyFactory = () -> AnyObject

protocol DependencyContainerInterface: AnyObject {
    func get<T>(_ arg: T.Type) -> T?
    func register<T>(_ arg: @escaping DependencyFactory, forMetaType metaType: T.Type)
}

final class DependencyContainer: DependencyContainerInterface {
    var dependencies = NSMapTable<NSString, AnyObject>(
        keyOptions: .strongMemory,
        valueOptions: .weakMemory
    )
    
    var dependencyCreators = [String: DependencyFactory]()
    
    public init() {}
    
    public func get<T>(_ arg: T.Type) -> T? {
        let name = String(describing: arg)
        let object = dependencies.object(forKey: name as NSString)
        
        guard object == nil else {
            return object as? T
        }
        
        guard let factory: DependencyFactory = dependencyCreators[name] else {
            return nil
        }
        
        let newInstance = factory()
        dependencies.setObject(newInstance, forKey: name as NSString)
        return newInstance as? T
    }
    
    public func register<T>(_ arg: @escaping DependencyFactory, forMetaType metaType: T.Type) {
        let name = String(describing: metaType)
        dependencyCreators[name] = arg
    }
}
