//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources

struct NonEmptyTextValidator: TextValidator {

    // MARK: - TextValidator

    func validate(text: String) -> TextValidationResult {
        return text.isEmpty ? .invalid(errorText: L10n.Localizable.TextFields.emptyError) : .valid
    }
}
