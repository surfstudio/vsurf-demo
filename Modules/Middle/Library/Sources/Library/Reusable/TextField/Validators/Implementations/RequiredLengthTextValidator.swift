//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources

struct RequiredLengthTextValidator: TextValidator {

    let length: Int

    // MARK: - TextValidator

    func validate(text: String) -> TextValidationResult {
        return text.count < length ? .invalid(errorText: L10n.Localizable.TextFields.lengthError) : .valid
    }
}
