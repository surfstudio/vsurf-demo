//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct PrefixTextFormatter: TextFormatter {

    // MARK: - Private properties

    private let maxLength: Int

    // MARK: - Init

    init(maxLength: Int) {
        self.maxLength = maxLength
    }

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return String(text.prefix(maxLength))
    }

}
