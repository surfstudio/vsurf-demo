//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public enum ButtonState {
    case normal
    case highlighted
    case disabled

    static func state(isEnabled: Bool, isPressed: Bool) -> ButtonState {
        guard isEnabled else {
            return .disabled
        }
        return isPressed ? .highlighted : .normal
    }
}

// MARK: - Color

extension Dictionary where Key == ButtonState, Value == ColorAsset {

    func getColor(for state: ButtonState) -> SwiftUI.Color? {
        self[state]?.color ?? self[.normal]?.color
    }

}
