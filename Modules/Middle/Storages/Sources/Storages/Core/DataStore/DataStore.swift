//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable

/// Протокол, определяющий интерфейс класса, отвечающего за хранение данных - Data.
/// Протокол определяет интерфейс, но не фиксирует жестко способ хранения.
///  - Note: Метод кодирования/декодирования определяется параметром `dataConverter` в `PersistentValueStore`
///  - Warning: Выбрасываемые ошибки зависят от реализации `DataStore`
@Mockable
public protocol DataStore: DataCleanerCompatible {
    /// Сохраняет данные в хранилище
    ///  - parameter data: Закодированные данные для хранения.
    func save(data: Data) throws
    /// Загружает данные из хранилища
    func load() throws -> Data?
    /// Очищает хранилище
    func erase() throws
}

// MARK: - Defaults

public extension DataStore {

    func clean() {
        try? erase()
    }

}
