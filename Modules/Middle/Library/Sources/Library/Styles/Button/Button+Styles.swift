//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Статические стили кнопок
public extension ButtonStyle where Self == RoundedButtonStyle {

    // MARK: - Primary

    static var primary: some ButtonStyle {
        RoundedButtonStyle(
            font: .subtitle1,
            cornerRadius: 12,
            padding: .init(top: 16, leading: 32, bottom: 16, trailing: 32),
            titleColors: [
                .normal: Asset.Colors.Buttons.Primary.normalText,
                .highlighted: Asset.Colors.Buttons.Primary.highlightedText,
                .disabled: Asset.Colors.Buttons.Primary.disabledText
            ],
            backgroundColors: [
                .normal: Asset.Colors.Buttons.Primary.normalBackground,
                .highlighted: Asset.Colors.Buttons.Primary.highlightedBackground,
                .disabled: Asset.Colors.Buttons.Primary.disabledBackground
            ]
        )
    }

    static var primarySmall: some ButtonStyle {
        RoundedButtonStyle(
            font: .subtitle2,
            cornerRadius: 12,
            padding: .init(top: 4, leading: 12, bottom: 4, trailing: 12),
            titleColors: [
                .normal: Asset.Colors.Buttons.Primary.normalText,
                .highlighted: Asset.Colors.Buttons.Primary.highlightedText,
                .disabled: Asset.Colors.Buttons.Primary.disabledText
            ],
            backgroundColors: [
                .normal: Asset.Colors.Buttons.Primary.normalBackground,
                .highlighted: Asset.Colors.Buttons.Primary.highlightedBackground,
                .disabled: Asset.Colors.Buttons.Primary.disabledBackground
            ]
        )
    }

    // MARK: - Secondary

    static var secondary: some ButtonStyle {
        RoundedButtonStyle(
            font: .subtitle1,
            cornerRadius: 12,
            padding: .init(top: 12, leading: 32, bottom: 12, trailing: 32),
            titleColors: [
                .normal: Asset.Colors.Buttons.Secondary.normalText,
                .highlighted: Asset.Colors.Buttons.Secondary.highlightedText,
                .disabled: Asset.Colors.Buttons.Secondary.disabledText
            ],
            backgroundColors: [
                .normal: Asset.Colors.Buttons.Secondary.normalBackground,
                .highlighted: Asset.Colors.Buttons.Secondary.highlightedBackground,
                .disabled: Asset.Colors.Buttons.Secondary.disabledBackground
            ]
        )
    }

    static var secondarySmall: some ButtonStyle {
        RoundedButtonStyle(
            font: .subtitle2,
            cornerRadius: 12,
            padding: .init(top: 4, leading: 12, bottom: 4, trailing: 12),
            titleColors: [
                .normal: Asset.Colors.Buttons.Secondary.normalText,
                .highlighted: Asset.Colors.Buttons.Secondary.highlightedText,
                .disabled: Asset.Colors.Buttons.Secondary.disabledText
            ],
            backgroundColors: [
                .normal: Asset.Colors.Buttons.Secondary.normalBackground,
                .highlighted: Asset.Colors.Buttons.Secondary.highlightedBackground,
                .disabled: Asset.Colors.Buttons.Secondary.disabledBackground
            ]
        )
    }
}

public extension ButtonStyle where Self == TextButtonStyle {

    // MARK: - Other

    static var textSystemAction: some ButtonStyle {
        TextButtonStyle(
            font: .paragraph1,
            padding: .init(top: 8, leading: 16, bottom: 8, trailing: 16),
            titleColors: [
                .normal: Asset.Colors.Main.systemAction,
                .highlighted: Asset.Colors.Main.systemAction,
                .disabled: Asset.Colors.Text.support
            ]
        )
    }

    static var textCancelSearch: some ButtonStyle {
        TextButtonStyle(
            font: .paragraph1,
            padding: .init(top: 8, leading: 16, bottom: 8, trailing: 16),
            titleColors: [
                .normal: Asset.Colors.SearchBar.cancelButton,
                .highlighted: Asset.Colors.SearchBar.cancelButton,
                .disabled: Asset.Colors.Text.support
            ]
        )
    }

    static var textParagraph2: some ButtonStyle {
        TextButtonStyle(
            font: .paragraph2,
            padding: .init(top: 8, leading: 16, bottom: 8, trailing: 16),
            titleColors: [
                .normal: Asset.Colors.Text.secondary,
                .highlighted: Asset.Colors.Text.secondary,
                .disabled: Asset.Colors.Text.support
            ]
        )
    }

}
