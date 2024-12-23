//
//  Copyright © Surf. All rights reserved.
//

import Combine
import SwiftUI

/// Модификатор для форматирования ввода в поле ввода
struct InputFormatterModifier: ViewModifier {
    @Binding var input: String

    var formatter: TextFormatter

    func body(content: Content) -> some View {
        content
            .onReceive(Just(input)) { newValue in
                self.input = formatter.format(text: newValue)
            }
    }
}

// MARK: - Accessor

public extension View {

    /// Модификатор для форматирования ввода в поле ввода
    func formatInput(_ input: Binding<String>, with formatter: TextFormatter) -> some View {
        return modifier(InputFormatterModifier(input: input, formatter: formatter))
    }

}
