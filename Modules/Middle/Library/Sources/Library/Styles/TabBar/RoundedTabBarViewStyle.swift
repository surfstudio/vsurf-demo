//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Стиль "парящего" `TabBar` со скруглениями
public struct RoundedTabBarViewStyle: TabBarViewStyle {

    // MARK: - Properties

    /// Шрифт текста лейблов
    let font: SwiftUI.Font
    /// Цвет текста неактивного элемента
    let normalTextColor: ColorAsset
    /// Цвет текста активного элемента
    let selectedTextColor: ColorAsset
    /// Цвет фона
    let normalBackgroundColor: ColorAsset
    /// Цвет фона активного элемента
    let selectedBackgroundColor: ColorAsset
    /// Радиус скругления
    let cornerRadius: CGFloat
    /// Внутренние отступы
    let padding: CGFloat
    /// Смещение относительно нижнего края
    let offset: CGSize

    // MARK: - TabBarViewStyle

    public func makeItem(_ item: TabItemView, isActive: Bool) -> some View {
        if isActive {
            item.foregroundStyle(selectedTextColor.color)
                .padding(padding)
                .background(isActive ? selectedBackgroundColor.color : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .labelStyle(.titleAndIcon)
        } else {
            item.foregroundStyle(normalTextColor.color)
                .padding(padding)
                .labelStyle(.iconOnly)
        }
    }

    public func makeContainer(_ container: AnyView) -> some View {
        container
            .font(font)
            .padding(padding)
            .background(normalBackgroundColor.color)
            .cornerRadius(cornerRadius)
            .offset(offset)
    }

}
