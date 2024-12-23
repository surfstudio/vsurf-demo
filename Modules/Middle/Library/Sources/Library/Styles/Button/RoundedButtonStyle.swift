//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public struct RoundedButtonStyle: ButtonStyle {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled: Bool

    // MARK: - Properties

    let font: SwiftUI.Font
    let cornerRadius: CGFloat
    let padding: EdgeInsets
    let titleColors: [ButtonState: ColorAsset]
    let backgroundColors: [ButtonState: ColorAsset]

    // MARK: - Style Body

    public func makeBody(configuration: Configuration) -> some View {
        let buttonState = ButtonState.state(isEnabled: isEnabled,
                                            isPressed: configuration.isPressed)
        configuration.label
            .font(font)
            .foregroundColor(titleColors.getColor(for: buttonState))
            .padding(padding)
            .background(backgroundColors.getColor(for: buttonState))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

}
