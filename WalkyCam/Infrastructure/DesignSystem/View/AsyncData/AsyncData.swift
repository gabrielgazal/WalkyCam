import SwiftUI

enum AsyncData<Success, Error> {
    case idle
    case loading
    case loaded(Success)
    case failed(Error)
}

extension AsyncData {
    var isLoaded: Bool {
        guard case .loaded = self else { return false }
        return true
    }
    
    var isFailed: Bool {
        guard case .failed = self else { return false }
        return true
    }
    
    var isLoading: Bool {
        guard case .loading = self else { return false }
        return true
    }
    
    var loadedValue: Success? {
        guard case let .loaded(value) = self else { return nil }
        return value
    }
    
    var failedValue: Error? {
        guard case let .failed(error) = self else { return nil }
        return error
    }
}

extension AsyncData: Equatable where Success: Equatable {
    static func == (lhs: AsyncData<Success, Error>, rhs: AsyncData<Success, Error>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.loaded(let lhsType), .loaded(let rhsType)):
            return lhsType == rhsType
        case(.failed, .failed):
            return true
        case(.idle, .idle):
            return true
        default:
            return false
        }
    }
}
