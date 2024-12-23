//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public enum TextFieldState {
    case normal
    case disabled
    case error

    static func getState(isEnabled: Bool, hasError: Bool) -> TextFieldState {
        if isEnabled {
            return hasError ? .error : .normal
        }
        return .disabled
    }
}

// MARK: - Color

extension Dictionary where Key == TextFieldState, Value == ColorAsset {

    func getColor(for state: TextFieldState) -> SwiftUI.Color? {
        self[state]?.color ?? self[.normal]?.color
    }

}

// MARK: - Environment

public enum TextFieldStateKey: EnvironmentKey {
    public static var defaultValue: TextFieldState = .normal
}

public extension EnvironmentValues {
    var textFieldState: TextFieldState {
        get { self[TextFieldStateKey.self] }
        set { self[TextFieldStateKey.self] = newValue }
    }
}
