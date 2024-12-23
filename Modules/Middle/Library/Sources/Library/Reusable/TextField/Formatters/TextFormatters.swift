//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import SurfCore

public func TextFormatters(@ArrayBuilder<TextFormatter>_ content: (TextFormatterFactory.Type) -> [TextFormatter]
) -> TextFormatter {
    content(TextFormatterFactory.self).combined
}
