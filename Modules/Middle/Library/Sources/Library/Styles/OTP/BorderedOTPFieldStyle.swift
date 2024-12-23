//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public struct BorderedOTPFieldStyle: OTPFieldStyle {

    // MARK: - Properties

    /// Шрифт полей ввода
    let font: SwiftUI.Font
    /// Цвета текста
    let textColors: [TextFieldState: ColorAsset]
    /// Цвета фона
    let backgroundColors: [TextFieldState: ColorAsset]
    /// Цвета обводки
    let borderColors: [TextFieldState: ColorAsset]
    /// Толщина обводки
    let borderWidth: CGFloat
    /// Горизонтальный отступ текста от фона
    let horizontalPadding: CGFloat
    /// Вертикальный отступ текста от фона
    let verticalPadding: CGFloat
    /// Радиус скругления
    let cornerRadius: CGFloat

    // MARK: - OTPFieldStyle

    public func makeItem(_ field: AnyView, for state: TextFieldState) -> some View {
        field
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .font(font)
            .foregroundColor(textColors.getColor(for: state))
            .background(backgroundColors.getColor(for: state))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: borderWidth)
                .stroke(borderColors.getColor(for: state) ?? .red, lineWidth: borderWidth)
            )
    }

}
