//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Класс, умеющий хранить Data в Keychain, удовлетворяет протоколу DataStore
final class KeychainDataStore: DataStore {

    // MARK: - Nested Types

    enum Error: LocalizedError {
        case failure(status: OSStatus)
        var errorDescription: String? {
            switch self {
            case .failure(let status):
                return SecCopyErrorMessageString(status, nil) as String?
            }
        }
    }

    // MARK: - Private Properties

    private let service: String
    private let key: String

    // MARK: - Initialization

    init(service: String, key: String) {
        self.service = service
        self.key = key
    }

    // MARK: - DataStore

    func save(data: Data) throws {
        let query = keyAttributes
        let status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            try update(data: data)
        case errSecItemNotFound:
            try insert(data: data)
        default:
            throw Error.failure(status: status)
        }
    }

    func load() throws -> Data? {
        var item: CFTypeRef?
        let query = keyQueryAttributes
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        if status == errSecItemNotFound {
            return nil
        }
        guard status == errSecSuccess, let data = item.flatMap({ $0 as? Data }) else {
            throw Error.failure(status: status)
        }
        return data
    }

    func erase() throws {
        let query = keyAttributes
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw Error.failure(status: status)
        }
    }

}

// MARK: - Private Methods

private extension KeychainDataStore {

    func update(data: Data) throws {
        let query = keyAttributes
        let attributes = keyUpdateAttributes(for: data)
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if status != errSecSuccess {
            throw Error.failure(status: status)
        }
    }

    func insert(data: Data) throws {
        let attributes = keyInsertAttributes(for: data)
        let status = SecItemAdd(attributes as CFDictionary, nil)
        if status != errSecSuccess {
            throw Error.failure(status: status)
        }
    }

    var keyAttributes: [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: key]
    }

    var keyQueryAttributes: [String: Any] {
        var query = keyAttributes
        query[kSecReturnData as String] = true
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        return query
    }

    func keyUpdateAttributes(for data: Data) -> [String: Any] {
        return [kSecValueData as String: data]
    }

    func keyInsertAttributes(for data: Data) -> [String: Any] {
        var query = keyAttributes
        query[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        query[kSecValueData as String] = data
        return query
    }

}
