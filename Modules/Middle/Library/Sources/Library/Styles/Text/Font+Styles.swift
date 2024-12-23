//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public extension SwiftUI.Font {

    // MARK: - Headline

    static var headline1: SwiftUI.Font {
        .custom(FontFamily.Inter.bold,
                size: 26,
                relativeTo: .headline)
    }

    static var headline2: SwiftUI.Font {
        .custom(FontFamily.Inter.bold,
                size: 22,
                relativeTo: .headline)
    }

    // MARK: - Paragraph

    static var paragraph1: SwiftUI.Font {
        .custom(FontFamily.Inter.regular,
                size: 16,
                relativeTo: .body)
    }

    static var paragraph2: SwiftUI.Font {
        .custom(FontFamily.Inter.regular,
                size: 14,
                relativeTo: .body)
    }

    static var paragraph3: SwiftUI.Font {
        .custom(FontFamily.Inter.regular,
                size: 12,
                relativeTo: .body)
    }

    static var paragraph4: SwiftUI.Font {
        .custom(FontFamily.Inter.regular,
                size: 10,
                relativeTo: .caption)
    }

    // MARK: - Subtitle

    static var subtitle1: SwiftUI.Font {
        .custom(FontFamily.Inter.semiBold,
                size: 16,
                relativeTo: .caption)
    }

    static var subtitle2: SwiftUI.Font {
        .custom(FontFamily.Inter.regular,
                size: 14,
                relativeTo: .caption)
    }
}
