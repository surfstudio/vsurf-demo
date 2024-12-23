//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Класс, отвечающий протоколу ValueStore и способный хранить информацию в временной памяти.
///
/// Фактически, данные, сохраненные в этом хранилище, умрут вместе с сессией приложения.
/// Никаких ограничений на хранимые типы не накладываются.
public final class TemporaryValueStore<Value>: ValueStore {

    // MARK: - Private Properties

    private var value: Value?

    // MARK: - Initialization

    public init(value: Value?) {
        self.value = value
    }

    // MARK: - ValueStore

    public func save(value: Value) {
        self.value = value
    }

    public func load() -> Value? {
        return value
    }

    public func erase() {
        value = nil
    }

}
