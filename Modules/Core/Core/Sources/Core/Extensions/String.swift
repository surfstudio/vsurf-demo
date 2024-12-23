//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public extension String {

    /// Возвращает все цифры из вызываемой строки
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    /// Возвращает строку, либо nil, если она пуста
    func normalized() -> String? {
        return self.isEmpty ? nil : self
    }

}
