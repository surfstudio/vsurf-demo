//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Obfuscator

/// Enum, содержащий  все строковые значения,
/// раскрытие которых потенциально опасно,
/// потому они хранятся в зашифрованном виде
public enum KeyDataProvider {

    public enum URLs {
        public static var mock: String {
            // https://r2.mocker.surfstudio.ru/tml2
            // swiftlint:disable line_length
            return Obfuscator.default.reveal(key: [41, 26, 13, 24, 18, 72, 107, 22, 5, 93, 92, 9, 95, 78, 42, 11, 11, 70, 18, 7, 54, 95, 4, 27, 7, 0, 89, 66, 111, 28, 12, 71, 21, 31, 40, 11]) ?? ""
            // swiftlint:enable line_length
        }
    }

}

// MARK: - Support

private extension Obfuscator {

    @inline(__always)
    static var `default`: Obfuscator {
        return Obfuscator(withSalt: "AnyharD9word0-")
    }

}
