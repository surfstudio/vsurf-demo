//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat
    var shakesPerUnit: CGFloat
    var animatableData: CGFloat

    func effectValue(size _: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0
            )
        )
    }
}

public extension View {
    /// Анимация тряски
    ///  - Parameters:
    ///     - isShaking: триггер анимации
    ///     - duration: продолжительность анимации
    func shake(isShaking: Binding<Bool>,
               amplitude: CGFloat = 10,
               count: CGFloat = 3,
               duration: TimeInterval = 0.25) -> some View {
        return modifier(ShakeEffect(amount: amplitude,
                                    shakesPerUnit: count,
                                    animatableData: isShaking.wrappedValue ? 1 : 0))
            .animation(.easeInOut(duration: duration), value: isShaking.wrappedValue)
    }
}
