//
//  Copyright © Surf. All rights reserved.
//

import Foundation

final class DataCleanerService: DataCleanerServiceInput {

    // MARK: - Nested Types

    private struct CleanableObject {
        let storage: DataCleanerCompatible
        let events: Set<AnyHashable>
    }

    // MARK: - Private Properties

    private var cleanableObjects: [CleanableObject] = []

    // MARK: - DataCleanerServiceInput

    func clean(event: AnyHashable) {
        cleanableObjects
            .filter { $0.events.contains(event) }
            .forEach { $0.storage.clean() }
    }

    // MARK: - Methods

    func add(storage: DataCleanerCompatible,
             for events: Set<AnyHashable>) {
        guard !events.isEmpty else {
            return
        }
        if let index = cleanableObjects.firstIndex(where: { $0.storage === storage }) {
            let object = cleanableObjects[index]
            cleanableObjects[index] = .init(storage: object.storage, events: object.events.union(events))
        } else {
            cleanableObjects.append(.init(storage: storage, events: events))
        }
    }

}
