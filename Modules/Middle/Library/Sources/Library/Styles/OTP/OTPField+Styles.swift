//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public extension View {

    func otpFieldStyle(_ style: any OTPFieldStyle) -> some View {
        self.environment(\.otpFieldStyle, style)
    }

}

public extension OTPFieldStyle where Self == RoundedOTPFieldStyle {

    /// Стиль, где каждый пин пароля имеет фон со скруглениями
    static var rounded: some OTPFieldStyle {
        RoundedOTPFieldStyle(
            font: .paragraph1,
            textColors: [
                .normal: Asset.Colors.TextInput.normal,
                .disabled: Asset.Colors.TextInput.disabled,
                .error: Asset.Colors.TextInput.error
            ],
            backgroundColors: [
                .normal: Asset.Colors.TextInput.background
            ],
            horizontalPadding: 4,
            verticalPadding: 8,
            cornerRadius: 12
        )
    }

}

public extension OTPFieldStyle where Self == BorderedOTPFieldStyle {

    /// Стиль, где каждый пин пароля имеет обводку
    static var bordered: some OTPFieldStyle {
        BorderedOTPFieldStyle(font: .headline2,
                              textColors: [
                                .normal: Asset.Colors.TextInput.normal,
                                .disabled: Asset.Colors.TextInput.disabled
                              ],
                              backgroundColors: [
                                .normal: Asset.Colors.TextInput.background
                              ],
                              borderColors: [
                                .normal: Asset.Colors.TextInput.normal,
                                .error: Asset.Colors.TextInput.error
                              ],
                              borderWidth: 2,
                              horizontalPadding: 4,
                              verticalPadding: 8,
                              cornerRadius: 12)
    }

}
