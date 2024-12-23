//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable

/// Протокол, определяющий интерфейс объекта,
/// способного хранить данные определенного типа
@Mockable
public protocol ValueStore<Value>: DataCleanerCompatible {
    associatedtype Value

    /// Сохраняет значение в хранилище
    ///  - parameter value: Значение для хранения.
    func save(value: Value)
    /// Загружает значение из хранилища
    func load() -> Value?
    /// Очищает хранилище
    func erase()
}

// MARK: - Defaults

public extension ValueStore {

    func clean() {
        erase()
    }

}

// MARK: - Helpers

public extension ValueStore {

    func combine(with newValue: Value,
                 defaultValue: Value,
                 modification: (Value, Value) -> Value) {
        let value = load() ?? defaultValue
        save(value: modification(value, newValue))
    }

}
