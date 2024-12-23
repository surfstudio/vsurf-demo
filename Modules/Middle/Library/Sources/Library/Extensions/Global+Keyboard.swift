//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

public func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil,
                                    from: nil,
                                    for: nil)
}
