//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public extension IndexViewStyle where Self == PageIndexViewStyle {

    static var `default`: Self {
        return page(backgroundDisplayMode: .always,
                    indicatorColor: Asset.Colors.PageControl.indicatorTint.color,
                    currentIndicatorColor: Asset.Colors.PageControl.activeIndicatorTint.color)
    }

    /// An index view style that places a page index view over its content.
    ///
    /// - Parameter backgroundDisplayMode: The display mode of the background of
    ///   any page index views receiving this style
    /// - Parameter indicatorColor: The tint color to apply to the page indicator.
    /// - Parameter currentIndicatorColor:The tint color to apply to the current page indicator
    static func page(
        backgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode,
        indicatorColor: Color,
        currentIndicatorColor: Color
    ) -> PageIndexViewStyle {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(indicatorColor)
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(currentIndicatorColor)
        return .page(backgroundDisplayMode: backgroundDisplayMode)
    }

}
