//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct DigitsTextFormatter: TextFormatter {

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.digits
    }

}
