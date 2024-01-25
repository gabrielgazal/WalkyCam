//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public enum NetworkingEvent: Equatable {
    case invalidateSession
}

public protocol NetworkingEventsObserver: AnyObject {
    func handle(_ event: NetworkingEvent)
}

public protocol NetworkingEventsDispatching {
    func dispatchEvent(_ event: NetworkingEvent)
}

public protocol NetworkingEventsObserverManaging {
    func addObserver(_ observer: NetworkingEventsObserver)
    func removeObserver(_ observerToRemove: NetworkingEventsObserver)
}

public final class NetworkingEventsManager: NetworkingEventsObserverManaging, NetworkingEventsDispatching {
    
    // MARK: - Singleton
    
    public static let shared = NetworkingEventsManager(observers: .init())
    
    // MARK: - Properties
    
    private var observers: [ObserverWeakReference]
    
    // MARK: - Intialization
    
    init(observers: [ObserverWeakReference]) {
        self.observers = observers
    }
    
    // MARK: - Lifecycle
    
    deinit { observers.removeAll() }
    
    // MARK: - NetworkingEventsObserverManaging
    
    public func addObserver(_ observer: NetworkingEventsObserver) {
        let weakReference = ObserverWeakReference(reference: observer)
        observers.append(weakReference)
    }
    
    public func removeObserver(_ observerToRemove: NetworkingEventsObserver) {
        guard let index = observers.firstIndex(
            where: { observer in observer.reference === observerToRemove })
        else { return }
        observers.remove(at: index)
    }
    
    // MARK: - NetworkingEventsDispatching
    
    public func dispatchEvent(_ event: NetworkingEvent) {
        observers.forEach { $0.reference.handle(event) }
    }
    
}
extension NetworkingEventsManager {
    struct ObserverWeakReference {
        var reference: NetworkingEventsObserver
    }
}
