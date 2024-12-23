//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public enum DataCleanerServiceFactory {

    // MARK: - Private Properties

    private static var service: DataCleanerService?

    // MARK: - Public Methods

    /// - returns: Протокол позволяющий очистить добавленные хранилища по событию
    public static func produce() -> DataCleanerServiceInput {
        getService()
    }
}

// MARK: - Private

extension DataCleanerServiceFactory {

    static func getService() -> DataCleanerService {
        if let service {
            return service
        }
        let service = DataCleanerService()
        Self.service = service
        return service
    }

}
