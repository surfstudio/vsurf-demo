//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

#if DEBUG
private let rainbowDebugColors: [Color] = [
    .purple,
    .blue,
    .green,
    .yellow,
    .orange,
    .red
]

public extension View {
    /// Случайным образом выбирает цвет фона.
    /// - Note: Используйте для отладки перерисовки View.
    func rainbowDebug() -> some View {
        self.background(rainbowDebugColors.randomElement() ?? .black)
            .opacity(.random(in: 0...1))
    }
}
#endif
