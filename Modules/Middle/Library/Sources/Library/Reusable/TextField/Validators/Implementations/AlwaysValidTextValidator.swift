//
//  Copyright © Surf. All rights reserved.
//

import Foundation

struct AlwaysValidTextValidator: TextValidator {

    // MARK: - TextValidator

    func validate(text _: String) -> TextValidationResult {
        return .valid
    }

}
