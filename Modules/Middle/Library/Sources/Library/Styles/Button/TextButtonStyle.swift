//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public struct TextButtonStyle: ButtonStyle {
    @Environment(\.isEnabled)
    private var isEnabled: Bool

    let font: SwiftUI.Font
    let padding: EdgeInsets
    let titleColors: [ButtonState: ColorAsset]

    public func makeBody(configuration: Configuration) -> some View {
        let buttonState = ButtonState.state(isEnabled: isEnabled,
                                            isPressed: configuration.isPressed)
        configuration.label
            .font(font)
            .foregroundColor(titleColors.getColor(for: buttonState))
            .padding(padding)
    }

}
