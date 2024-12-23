//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources

public enum FieldConstants {

    public enum Phone {
        public enum Mask {
            public static let russian = "+7 (###) ###-##-##"
        }

        public static let emptyError = L10n.Localizable.TextFields.emptyError
        public static let wrongFormatError = L10n.Localizable.TextFields.validationError

        public static let placeholder = L10n.Localizable.TextFields.phone
    }

    public enum Email {
        public static let wrongFormatError = L10n.Localizable.TextFields.validationError
        public static let placeholder = L10n.Localizable.TextFields.email
        public static let maxLength = 256
        // swiftlint:disable:next line_length
        public static let regex = "(?:[a-zA-Z0-9!#$№%&'*+=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5]| 2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]: (?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    }

    public enum Name {
        public static let minLength = 1
        public static let maxLength = 75
        public static var allowedCharacters: CharacterSet {
            let letters = CharacterSet.letters
            let specSymbols = CharacterSet(charactersIn: " -")
            return letters.union(specSymbols)
        }

        public enum Placeholder {
            public static let name = L10n.Localizable.TextFields.name
            public static let surname = L10n.Localizable.TextFields.surname
        }
    }

    public enum Birthday {
        public static let placeholder = L10n.Localizable.TextFields.birthday
        public static let dateFormat = "dd.MM.yyyy"
        public static let minimumDate = formatter().date(from: "01.01.1900") ?? Date.distantPast

        public static func formatter() -> DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            return formatter
        }
    }

    public enum Sex {
        public static let placeholder = L10n.Localizable.TextFields.sex
    }

}
