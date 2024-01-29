import Foundation

public protocol KeychainProtocol {
    func add(_ attributes: [CFString: Any]) -> OSStatus
    func fetch(_ query: [CFString: Any]) -> Keychain.Result
    func update(_ query: [CFString: Any], with newAttributes: [CFString: Any]) -> OSStatus
    func delete(_ query: [CFString: Any]) -> OSStatus
}
