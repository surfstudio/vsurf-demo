//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct UppercasedTextFormatter: TextFormatter {

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.uppercased()
    }

}
