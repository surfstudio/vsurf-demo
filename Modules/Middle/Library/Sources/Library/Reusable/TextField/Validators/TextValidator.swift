//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable
import Resources

/// Протокол для проверки вводимого текста
@Mockable
public protocol TextValidator {
    /// - parameter text: анализируемый текст.
    /// - returns: `.invalid` с локализованной ошибкой, либо `.valid`
    func validate(text: String) -> TextValidationResult
}
