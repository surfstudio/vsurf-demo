//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources

struct RegexTextValidator: TextValidator {

    // MARK: - Private Properties

    let regex: String

    // MARK: - TextValidator

    func validate(text: String) -> TextValidationResult {
        if text.range(of: regex, options: .regularExpression) == nil {
            return .invalid(errorText: L10n.Localizable.TextFields.validationError)
        }
        return .valid
    }
}
