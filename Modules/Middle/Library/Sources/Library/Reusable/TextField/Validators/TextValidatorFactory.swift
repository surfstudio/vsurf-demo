//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Фабрика для создания валидаторов.
///  - Note: Для комбинации нескольких валидаторов используйте `TextValidators`.
public enum TextValidatorFactory {

    /// Валидатор, всегда выдающий успех
    public static func alwaysValid() -> TextValidator {
        return AlwaysValidTextValidator()
    }

    /// Валидатор с мягким `<=` ограничением на длину строки
    /// - parameter length: Ограничитель длины.
    public static func maxLength(_ length: Int) -> TextValidator {
        return MaxLengthTextValidator(length: length)
    }

    /// Валидатор с мягким `>=` требованием на длину строки
    /// - parameter length: Ограничитель длины.
    public static func minLength(_ length: Int) -> TextValidator {
        return MinLengthTextValidator(length: length)
    }

    /// Валидатор, пресекающий пустые строки
    public static func nonEmpty() -> TextValidator {
        return NonEmptyTextValidator()
    }

    /// Валидатор, использующий регулярное выражение для проверки текста
    /// - parameter regex: Регулярное выражение.
    public static func regex(_ regex: String) -> TextValidator {
        return RegexTextValidator(regex: regex)
    }

    /// Валидатор с жестким требованием на длину строки
    /// - parameter length: Ограничитель длины.
    public static func requiredLength(_ length: Int) -> TextValidator {
        return RequiredLengthTextValidator(length: length)
    }

}
