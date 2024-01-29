import Foundation

protocol KeychainPersistenceProtocol {
    func set(_ data: Data, forKey key: String) throws
    func set<T: Codable>(_ value: T, forKey key: String) throws
    func set(_ value: String, forKey key: String) throws
    
    func data(forKey key: String) throws -> Data
    func codable<T: Codable>(forKey key: String) throws -> T
    func string(forKey key: String) throws -> String

    func removeObject(forKey key: String) throws    
    func clear() throws
}
