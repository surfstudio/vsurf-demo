//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Стиль классического `TabBar` с фоном и разделителем
public struct ClassicTabBarViewStyle: TabBarViewStyle {

    // MARK: - Properties

    /// Шрифт текста лейблов
    let font: SwiftUI.Font
    /// Цвет текста неактивного элемента
    let normalTextColor: ColorAsset
    /// Цвет текста активного элемента
    let selectedTextColor: ColorAsset
    /// Цвет фона
    let backgroundColor: ColorAsset
    /// Цвет верхней границы
    let borderColor: ColorAsset
    /// Внутренние отступы
    let padding: CGFloat

    // MARK: - TabBarViewStyle

    public func makeItem(_ item: TabItemView, isActive: Bool) -> some View {
        item.foregroundStyle(isActive ? selectedTextColor.color : normalTextColor.color)
            .padding(padding)
            .labelStyle(.vertical)
            .frame(maxWidth: .infinity)
    }

    public func makeContainer(_ container: AnyView) -> some View {
        container
            .font(font)
            .background(backgroundColor.color)
            .frame(maxWidth: .infinity)
            .overlay(Rectangle()
                .frame(height: 1)
                .foregroundColor(borderColor.color),
                     alignment: .top
            )
    }
}
