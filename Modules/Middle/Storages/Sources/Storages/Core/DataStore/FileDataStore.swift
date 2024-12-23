//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Класс, умеющий хранить Data в файловой системе, удовлетворяет протоколу DataStore
final class FileDataStore: DataStore {

    // MARK: - Private Properties

    private let urlPath: URL

    // MARK: - Initialization

    init(urlPath: URL) {
        self.urlPath = urlPath
    }

    // MARK: - DataStore

    func save(data: Data) throws {
        try data.write(to: urlPath, options: .atomic)
    }

    func load() throws -> Data? {
        guard FileManager.default.fileExists(atPath: urlPath.path) else {
            return nil
        }
        return try Data(contentsOf: urlPath)
    }

    func erase() throws {
        try FileManager.default.removeItem(at: urlPath)
    }

}
