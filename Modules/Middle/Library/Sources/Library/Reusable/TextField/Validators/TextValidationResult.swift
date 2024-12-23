//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

/// Результат валидации текста
public enum TextValidationResult: Equatable {
    /// Успешная валидация
    case valid
    /// Провальная валидация
    ///  - parameter errorText: Локализованный текст ошибки.
    case invalid(errorText: String)

    /// - returns: `true` если валидация прошла без ошибок, `false` иначе.
    public var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .invalid:
            return false
        }
    }

    /// Текст ошибки.
    /// - returns: `nil` при успешной валидации, текст ошибки иначе.
    public var errorText: String? {
        switch self {
        case .valid:
            return nil
        case .invalid(let errorText):
            return errorText
        }
    }
}
