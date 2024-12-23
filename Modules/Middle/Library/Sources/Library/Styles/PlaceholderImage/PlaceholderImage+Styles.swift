//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources
import SwiftUI

public extension View {

    func placeholderImageStyle(_ style: any PlaceholderImageStyle) -> some View {
        self.environment(\.placeholderImageStyle, style)
    }

}

extension PlaceholderImageStyle where Self == RegularPlaceholderImageStyle {

    static var regular: some PlaceholderImageStyle {
        return RegularPlaceholderImageStyle(
            icon: .normal,
            iconTintColor: Asset.Colors.Main.placeholderTint.color,
            backgroundColor: Asset.Colors.Main.placeholderBackground.color
        )
    }

}
