//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable

/// Протокол для форматирования введенного текста
@Mockable
public protocol TextFormatter {
    /// - parameter text: Исходный текст.
    /// - returns: Отформатированный текст.
    func format(text: String) -> String
}
