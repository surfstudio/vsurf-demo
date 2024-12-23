//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct LowercasedTextFormatter: TextFormatter {

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.lowercased()
    }

}
