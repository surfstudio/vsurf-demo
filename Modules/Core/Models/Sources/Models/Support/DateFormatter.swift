//
//  Copyright © Surf. All rights reserved.
//

import Foundation

extension DateFormatter {

    // MARK: - Properties

    /// DateFormatter для преобразований String <-> Date,
    /// где строка имеет вид "dd.MM.yyyy"
    static var defaultServerDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        // Необходимо чтобы считалось как самое начало дня
        // в независимоти от текущей локали
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }

    /// DateFormatter для преобразований String <-> Date,
    /// где строка имеет вид "yyyy-MM-dd'T'HH:mm:ssZ"
    static var defaultServerDateTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }

    // MARK: - Methods

    /// Эквивалент метода date(from string: String) где входная String опциональна.
    /// Возвращает nil если входной параметр равен nil.
    func date(from optionalString: String?) -> Date? {
        guard let string = optionalString else {
            return nil
        }
        return date(from: string)
    }

    /// Эквивалент метода string(from date: Date) где входная Date опциональна.
    /// Возвращает nil если входной параметр равен nil.
    func string(fromOptionalDate optionalDate: Date?) -> String? {
        guard let date = optionalDate else {
            return nil
        }
        return string(from: date)
    }

}
