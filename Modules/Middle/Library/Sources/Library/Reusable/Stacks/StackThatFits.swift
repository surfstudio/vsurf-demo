//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

/// В зависимости от свободного места, будет выбран **вертикальный** или **горизонтальный** стек
public struct StackThatFits<Content: View>: View {

    // MARK: - Properties

    var horizontalAlignment: HorizontalAlignment = .center
    var verticalAlignment: VerticalAlignment = .center
    var spacing: CGFloat = 16

    @ViewBuilder var content: () -> Content

    public var body: some View {
        ViewThatFits {
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
        }
    }
}
