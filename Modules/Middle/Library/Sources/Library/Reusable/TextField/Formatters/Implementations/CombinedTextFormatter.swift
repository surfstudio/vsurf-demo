//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Форматтер последовательно выполнит форматтирование вложенными форматтерами.
/// - Note: Порядок добавления форматтеров важен.
struct CombinedTextFormatter: TextFormatter {

    // MARK: - Properties

    let formatters: [TextFormatter]

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return formatters.reduce(text) { $1.format(text: $0) }
    }
}

// MARK: - Array support

extension Array where Element == any TextFormatter {

    var combined: TextFormatter {
        CombinedTextFormatter(formatters: self)
    }

}
