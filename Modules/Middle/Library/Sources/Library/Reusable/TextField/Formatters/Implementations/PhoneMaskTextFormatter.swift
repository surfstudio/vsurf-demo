//
//  Copyright © Surf. All rights reserved.
//

import Foundation

class PhoneMaskTextFormatter: TextFormatter {

    // MARK: - Nested types

    struct ParsedText {
        let source: String
        let digits: [Character]
    }

    /// Определяет характер форматирования в зависимости от предыдущего стейта
    enum EditingMode {
        case insertion(dropCount: Int)
        case normal(dropCount: Int)
        case backspace(dropCount: Int)

        static func compare(oldText: ParsedText,
                            newText: ParsedText,
                            maskCodeDigitsCount _: Int,
                            maskPlaceholderDigitsCount: Int) -> EditingMode {
            let diff = oldText.source.count - newText.source.count
            switch diff {
            case 1:
                // новый текст меньше старого на 1, значит юзер удаляет бэкспейсом
                // если юзер стирает заполнитель маски, то мы должны дропнуть цифру
                // чтобы редактирование прошло органично
                return .backspace(dropCount: oldText.digits.count == newText.digits.count ? 1 : 0)
            case -1:
                // новый текст больше старого на 1, значит юзер печатает
                // обрезаем ввод с конца, когда длина превышает максимальную
                let maskDiff = newText.digits.count - maskPlaceholderDigitsCount
                return .normal(dropCount: maskDiff > 0 ? maskDiff : 0)
            default:
                // юзер вставляет
                // если это вставка скопированного номера с кодом страны
                // код вырезаем
                let maskDiff = newText.digits.count - maskPlaceholderDigitsCount
                return .insertion(dropCount: maskDiff > 0 ? maskDiff : 0)
            }
        }
    }

    // MARK: - Private Properties

    /// Маска вида `+7 ### ###-##-##` где вместо `#` будут подставляться цифры.
    private let mask: String
    /// Заполнитель ввода внутри маски. Например, `#`.
    private let maskPlaceholder: Character

    /// Префикс с кодом страны и декорациями. Например,`+7`.
    private var countryCode: String {
        String(mask.prefix(while: { $0.isNumber || $0 == "+" }))
    }

    /// Максимально допустимая длина после которой будут отбрасываться входные данные
    private var maxLength: Int {
        mask.filter { $0 == maskPlaceholder }.count
    }

    /// Буферная переменная для определения типа редактирования (inc/dec)
    private var cachedText = ""

    // MARK: - Init

    init(mask: String, maskPlaceholder: Character = "#") {
        self.mask = mask
        self.maskPlaceholder = maskPlaceholder
    }

    // MARK: - TextFormatter

    func format(text: String) -> String {
        let oldText = parseText(cachedText)
        let newText = parseText(text)
        let editingMode: EditingMode = .compare(oldText: oldText,
                                                newText: newText,
                                                maskCodeDigitsCount: countryCode.digits.count,
                                                maskPlaceholderDigitsCount: maxLength)
        cachedText = format(newText.digits, using: editingMode)
        return cachedText
    }

}

// MARK: - Private

private extension PhoneMaskTextFormatter {

    func dropPrefix(_ prefix: String, from text: String) -> String {
        if text.hasPrefix(prefix) {
            return String(text.dropFirst(prefix.count))
        }
        return text
    }

    func parseText(_ text: String) -> ParsedText {
        return ParsedText(source: text, digits: parseDigits(from: text))
    }

    func parseDigits(from text: String) -> [Character] {
        // отбрасываем код страны вшитый в маску с предыдущего форматирования
        let clearText = dropPrefix(countryCode, from: text)

        // оставляем только цифры
        return Array(clearText.digits)
    }

    func format(_ digits: [Character], using editingMode: EditingMode) -> String {
        var result = mask

        // отбрасываем цифры в соответсвие с режимом редактирования
        let digits: [Character] = {
            switch editingMode {
            case .insertion(let dropCount):
                return [Character](digits.dropFirst(dropCount))
            case .normal(let dropCount):
                return digits.dropLast(dropCount)
            case .backspace(let dropCount):
                return digits.dropLast(dropCount)
            }
        }()

        // заполняем маску
        digits.forEach { digit in
            if let index = result.firstIndex(of: maskPlaceholder) {
                result.replaceSubrange(index...index, with: [digit])
            }
        }

        // чистим незаполненные плейсхолдеры
        if let firstPlaceholderIndex = result.firstIndex(of: maskPlaceholder),
            firstPlaceholderIndex != result.endIndex {
            result.removeSubrange(firstPlaceholderIndex..<result.endIndex)
        }

        return result
    }

}
