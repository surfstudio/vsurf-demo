//
//  Copyright © Surf. All rights reserved.
//

import Core
import Resources

public extension Error {

    var humanReadableMessage: String {
        if let customError = self as? HumanReadableError {
            guard
                let message = customError.message,
                !message.isEmpty
            else {
                return L10n.Localizable.Error.default
            }
            return message
        }
        return L10n.Localizable.Error.noInternetConnection
    }

}
