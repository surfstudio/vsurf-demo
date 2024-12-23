//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable

/// Протокол для кодирования/декодирования данных.
/// По сути, маскировка для быстрого переключения между `PropertyListEncoder/Decoder`, `JSONEncoder/Decoder` и тп.
@Mockable
public protocol DataConverter {
    /// - parameter value: Исходное значение.
    /// - returns: Закодированное значение.
    func encode<T: Encodable>(_ value: T) throws -> Data
    /// - parameter type: Тип значения.
    /// - parameter data: Закодированное значение.
    /// - returns: Исходное значение.
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}
