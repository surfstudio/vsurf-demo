//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct TrimmingTextFormatter: TextFormatter {

    // MARK: - Properties

    let characters: CharacterSet

    // MARK: - TextFormatter

    func format(text: String) -> String {
        return text.trimmingCharacters(in: characters)
    }

}
