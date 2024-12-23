//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import SurfCore

public func TextValidators(@ArrayBuilder<TextValidator>_ content: (TextValidatorFactory.Type) -> [TextValidator]
) -> TextValidator {
    content(TextValidatorFactory.self).combined
}
