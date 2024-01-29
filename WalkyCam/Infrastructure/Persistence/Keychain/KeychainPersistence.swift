import Foundation

public struct KeychainPersistence: KeychainPersistenceProtocol {

    private let serviceName =  Bundle.main.bundleIdentifier ?? "proplus.Keychain"
    private let keychain: KeychainProtocol
    
    init(keychain: KeychainProtocol = Keychain()) {
        self.keychain = keychain
    }

    // MARK: - Set values
    
    public func set(_ data: Data, forKey key: String) throws {
        var keychainQueryDictionary: [CFString: Any] = setupKeychainQueryDictionary(forKey: key)
        keychainQueryDictionary[kSecValueData] = data

        let status = keychain.add(keychainQueryDictionary)

        if status == errSecDuplicateItem {
            try update(data, forKey: key)
        } else if status != noErr {
            throw KeychainError.unhandled(status: status)
        }
    }

    public func set<T: Codable>(_ value: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        try set(data, forKey: key)
    }

    public func set(_ value: String, forKey key: String) throws {
        guard let data = value.data(using: .utf8) else {
            throw KeychainError.unexpectedItemData
        }
        try set(data, forKey: key)
    }
    
    // MARK: - Get values
    
    public func data(forKey key: String) throws -> Data {
        var keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key)
        keychainQueryDictionary[kSecMatchLimit] = kSecMatchLimitOne
        keychainQueryDictionary[kSecReturnData] = kCFBooleanTrue

        let result = keychain.fetch(keychainQueryDictionary)

        switch result.status {
        case noErr:
            guard let data = result.queryResult as? Data else {
                throw KeychainError.unexpectedItemData
            }
            return data
        case errSecItemNotFound:
            throw KeychainError.noItem
        default:
            throw KeychainError.unhandled(status: result.status)
        }
    }

    public func codable<T: Codable>(forKey key: String) throws -> T {
        let keychainData = try data(forKey: key)
        do {
            return try JSONDecoder().decode(T.self, from: keychainData)
        } catch {
            throw KeychainError.unexpectedItemData
        }
    }

    public func string(forKey key: String) throws -> String {
        let keychainData = try data(forKey: key)
        guard let value = String(data: keychainData, encoding: .utf8) else {
            throw KeychainError.unexpectedItemData
        }
        return value
    }

    // MARK: - Remove value

    public func removeObject(forKey key: String) throws {
        let keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key)
        let status: OSStatus = keychain.delete(keychainQueryDictionary)

        if status != noErr && status != errSecItemNotFound {
            throw KeychainError.unhandled(status: status)
        }
    }

    public func clear() throws {
        var keychainQueryDictionary: [CFString: Any] = [kSecClass: kSecClassGenericPassword]
        keychainQueryDictionary[kSecAttrService] = serviceName
        let status: OSStatus = keychain.delete(keychainQueryDictionary)

        if status == errSecItemNotFound {
            throw KeychainError.noItem
        }

        if status != noErr && status != errSecItemNotFound {
            throw KeychainError.unhandled(status: status)
        }
    }

    // MARK: - Private methods

    private func update(_ value: Data, forKey key: String) throws {
        let keychainQueryDictionary: [CFString: Any] = setupKeychainQueryDictionary(forKey: key)
        let updateDictionary = [kSecValueData: value]

        let status = keychain.update(keychainQueryDictionary, with: updateDictionary)

        if status != noErr {
            throw KeychainError.unhandled(status: status)
        }
    }

    private func setupKeychainQueryDictionary(forKey key: String) -> [CFString: Any] {
        var keychainQueryDictionary: [CFString: Any] = [kSecClass: kSecClassGenericPassword]
        let encodedIdentifier: Data? = key.data(using: String.Encoding.utf8)

        keychainQueryDictionary[kSecAttrService] = serviceName
        keychainQueryDictionary[kSecAttrGeneric] = encodedIdentifier
        keychainQueryDictionary[kSecAttrAccount] = encodedIdentifier

        return keychainQueryDictionary
    }
}
