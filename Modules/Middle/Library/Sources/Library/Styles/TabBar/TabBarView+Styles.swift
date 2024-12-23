//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public extension View {

    func tabBarViewStyle(_ style: any TabBarViewStyle) -> some View {
        self.environment(\.tabBarViewStyle, style)
    }

}

public extension TabBarViewStyle where Self == RoundedTabBarViewStyle {
    /// Стиль "парящего" `TabBar` со скруглениями
    static var rounded: some TabBarViewStyle {
        RoundedTabBarViewStyle(
            font: .paragraph3,
            normalTextColor: Asset.Colors.Tabbar.itemTint,
            selectedTextColor: Asset.Colors.Tabbar.selectedItemTint,
            normalBackgroundColor: Asset.Colors.Buttons.Primary.normalBackground,
            selectedBackgroundColor: Asset.Colors.Buttons.Primary.highlightedBackground,
            cornerRadius: 36,
            padding: 8,
            offset: .init(width: 0, height: -16)
        )
    }
}

public extension TabBarViewStyle where Self == ClassicTabBarViewStyle {
    /// Стиль классического `TabBar` с фоном и разделителем
    static var classic: some TabBarViewStyle {
        ClassicTabBarViewStyle(
            font: .paragraph4,
            normalTextColor: Asset.Colors.Tabbar.itemTint,
            selectedTextColor: Asset.Colors.Tabbar.selectedItemTint,
            backgroundColor: Asset.Colors.Tabbar.background,
            borderColor: Asset.Colors.Tabbar.separator,
            padding: 8
        )
    }
}
