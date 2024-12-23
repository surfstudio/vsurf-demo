//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public struct RoundedFloatingTextFieldStyle: FloatingTextFieldStyle {

    // MARK: - FloatingTextFieldStyle Properties

    public var textFont: SwiftUI.Font = .subtitle1
    public var hintFont: SwiftUI.Font = .paragraph1
    public var floatingHintFont: SwiftUI.Font = .paragraph4
    public var errorFont: SwiftUI.Font = .paragraph2
    public var errorColor: ColorAsset = Asset.Colors.TextInput.error
    public var hintColor: ColorAsset = Asset.Colors.TextInput.placeholder
    public var textColors: [TextFieldState: ColorAsset] = [
        .normal: Asset.Colors.TextInput.normal,
        .disabled: Asset.Colors.TextInput.disabled
    ]
    public var backgroundColors: [TextFieldState: ColorAsset] = [.normal: Asset.Colors.TextInput.background]

    // MARK: - Custom Properties

    var cornerRadius: CGFloat = 12

    // MARK: - FloatingTextFieldStyle Methods

    public func makeContent(_ container: AnyView, for fieldState: TextFieldState) -> some View {
        container
            .font(textFont)
            .foregroundColor(textColors.getColor(for: fieldState))
            .background(backgroundColors.getColor(for: fieldState))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

}
