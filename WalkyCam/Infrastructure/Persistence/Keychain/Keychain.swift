import Foundation

public class Keychain: KeychainProtocol {
    
    public struct Result {
        init(status: OSStatus, queryResult: AnyObject? = nil) {
            self.status = status
            self.queryResult = queryResult
        }
        
        public let status: OSStatus
        public let queryResult: AnyObject?
    }
    
    public init() { }
    
    public func add(_ attributes: [CFString: Any]) -> OSStatus {
        return SecItemAdd(attributes as CFDictionary, nil)
    }
    
    public func fetch(_ query: [CFString: Any]) -> Result {
        
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        return Result(status: status, queryResult: queryResult)
    }
    
    public func update(_ query: [CFString: Any], with newAttributes: [CFString: Any]) -> OSStatus {
        return SecItemUpdate(query as CFDictionary, newAttributes as CFDictionary)
    }

    public func delete(_ query: [CFString: Any]) -> OSStatus {
        return SecItemDelete(query as CFDictionary)
    }
}
