//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public enum TextFormatterFactory {

    /// Применяет капитализацию каждому слову
    public static func capitalized() -> TextFormatter {
        return CapitalizedTextFormatter()
    }

    /// Меняет регистр на строчный
    public static func lowercased() -> TextFormatter {
        return LowercasedTextFormatter()
    }

    /// Оставляет только цифры
    public static func digits() -> TextFormatter {
        return DigitsTextFormatter()
    }

    /// Никак не форматирует вводимый текст
    public static func noChange() -> TextFormatter {
        return NoChangeTextFormatter()
    }

    /// Форматтер для ввода телефона с настраиваемой маской
    ///  - parameter mask: Маска вида `+7 (###) ###-##-##`, где `#` - maskPlacehoder.
    ///  - parameter maskPlaceholder: Заполнитель маски, вместо которого будут вставляться цифры.
    public static func phoneMask(mask: String, maskPlaceholder: Character = "#") -> TextFormatter {
        return PhoneMaskTextFormatter(mask: mask, maskPlaceholder: maskPlaceholder)
    }

    /// Оставляет только `length` первых символов
    /// - parameter length: Длина префикса
    public static func prefix(_ length: Int) -> TextFormatter {
        return PrefixTextFormatter(maxLength: length)
    }

    /// Вырезает все символы из `CharacterSet` с границ текста.
    /// - parameter characters: Набор символов для вырезания.
    public static func trimming(_ characters: CharacterSet) -> TextFormatter {
        return TrimmingTextFormatter(characters: characters)
    }

    /// Меняет регистр на заглавный
    public static func uppercased() -> TextFormatter {
        return UppercasedTextFormatter()
    }

}
