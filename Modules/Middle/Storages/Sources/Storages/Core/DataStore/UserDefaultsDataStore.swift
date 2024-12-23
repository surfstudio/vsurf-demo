//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Класс, умеющий хранить Data в UserDefaults, удовлетворяет протоколу DataStore
final class UserDefaultsDataStore: DataStore {

    // MARK: - Nested Types

    enum Error: Swift.Error {
        case invalidData
    }

    // MARK: - Private Properties

    private let userDefaults: UserDefaults
    private let key: String

    // MARK: - Initialization

    init(suiteName: String?, key: String) {
        self.userDefaults = UserDefaults(suiteName: suiteName) ?? .init()
        self.key = key
    }

    // MARK: - DataStore

    func save(data: Data) throws {
        userDefaults.setValue(data, forKey: key)
    }

    func load() throws -> Data? {
        guard let value = userDefaults.value(forKey: key) else {
            return nil
        }
        guard let data = value as? Data else {
            throw Error.invalidData
        }
        return data
    }

    func erase() throws {
        userDefaults.removeObject(forKey: key)
    }

}
