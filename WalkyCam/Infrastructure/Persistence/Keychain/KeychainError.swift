import Foundation

public enum KeychainError: LocalizedError, Equatable {
    case noItem
    case unexpectedItemData
    case unhandled(status: OSStatus)
}

extension KeychainError {
    public var errorDescription: String? {
        switch self {
        case .noItem: return "KeychainError no item"
        case .unexpectedItemData: return "KeychainError unexpected item data"
        case .unhandled(let status): return "KeychainError unhandled error - OSStatus: \(status)"
        }
    }
}
