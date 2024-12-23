//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public enum DataCleanerServiceInjector {

    /// "Подписывает" хранилища на очистку при возникновении событий.
    /// - parameter storage: Хранилище чего-либо с возможностью очистки. Например, любой `DataStore`
    /// - parameter events: Набор событий в результате которых разрешена очистка хранилища
    public static func inject(storage: DataCleanerCompatible,
                              for events: Set<AnyHashable>) {
        DataCleanerServiceFactory
            .getService()
            .add(storage: storage, for: events)
    }
}
