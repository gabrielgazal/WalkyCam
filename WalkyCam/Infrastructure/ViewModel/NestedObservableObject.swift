//
//  NestedObservableObject.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI
import Combine

@propertyWrapper
struct NestedObservableObject<Value: ObservableObject> {

    static subscript<T: ObservableObject>(
        _enclosingInstance instance: T,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<T, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<T, Self>
    ) -> Value {

        get {
            if instance[keyPath: storageKeyPath].cancellable == nil, let publisher = instance.objectWillChange as? ObservableObjectPublisher {
                instance[keyPath: storageKeyPath].cancellable =
                    instance[keyPath: storageKeyPath].storage.objectWillChange.sink { _ in
                            publisher.send()
                    }
            }

            return instance[keyPath: storageKeyPath].storage
         }
         set {
             if let cancellable = instance[keyPath: storageKeyPath].cancellable {
                 cancellable.cancel()
             }
             if let publisher = instance.objectWillChange as? ObservableObjectPublisher {
                 instance[keyPath: storageKeyPath].cancellable =
                     newValue.objectWillChange.sink { _ in
                             publisher.send()
                     }
             }
             instance[keyPath: storageKeyPath].storage = newValue
         }
    }

    @available(*, unavailable,
        message: "This property wrapper can only be applied to classes"
    )
    var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() }
    }

    private var cancellable: AnyCancellable?
    private var storage: Value

    init(wrappedValue: Value) {
        storage = wrappedValue
    }
}
