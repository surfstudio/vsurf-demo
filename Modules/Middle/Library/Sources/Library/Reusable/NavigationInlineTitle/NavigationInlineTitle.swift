//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

public extension View {

    func navigationInlineTitle(_ title: String, font: SwiftUI.Font) -> some View {
        return self
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(font)
                }
            }
    }

}
