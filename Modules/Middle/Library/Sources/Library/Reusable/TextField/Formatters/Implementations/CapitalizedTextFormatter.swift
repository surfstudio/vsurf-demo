//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct CapitalizedTextFormatter: TextFormatter {

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.capitalized
    }

}
