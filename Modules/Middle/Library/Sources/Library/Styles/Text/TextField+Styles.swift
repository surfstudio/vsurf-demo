//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Статические стили для TextField

public extension View {

    func floatingTextFieldStyle(_ style: any FloatingTextFieldStyle) -> some View {
        self.environment(\.floatingTextFieldStyle, style)
    }

}

public extension FloatingTextFieldStyle where Self == RoundedFloatingTextFieldStyle {
    /// Дефолтный стиль с закругленным фоном
    static var rounded: some FloatingTextFieldStyle {
        RoundedFloatingTextFieldStyle()
    }
}

public extension FloatingTextFieldStyle where Self == BorderedFloatingTextFieldStyle {
    /// Дефолтный стиль с рамкой
    static var bordered: some FloatingTextFieldStyle {
        BorderedFloatingTextFieldStyle()
    }
}

public extension FloatingTextFieldStyle where Self == UnderlinedFloatingTextFieldStyle {
    /// Дефолтный стиль с подчеркиванием
    static var underlined: some FloatingTextFieldStyle {
        UnderlinedFloatingTextFieldStyle()
    }
}
