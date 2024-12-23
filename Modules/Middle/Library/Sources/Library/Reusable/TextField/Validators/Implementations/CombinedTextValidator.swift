//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Валидатор, собирающий в себе несколько валидаторов.
/// Вернет первый `invalid` статус либо `valid`, если все проверки прошли успешно.
struct CombinedTextValidator: TextValidator {

    // MARK: - Properties

    private let validators: [TextValidator]

    // MARK: - Init

    init(_ validators: [TextValidator]) {
        self.validators = validators
    }

    // MARK: - TextValidator

    func validate(text: String) -> TextValidationResult {
        for validator in validators {
            let result = validator.validate(text: text)
            if result.errorText != nil {
                return result
            }
        }
        return .valid
    }
}

// MARK: - Array support

extension Array where Element == any TextValidator {

    var combined: TextValidator {
        CombinedTextValidator(self)
    }

}
