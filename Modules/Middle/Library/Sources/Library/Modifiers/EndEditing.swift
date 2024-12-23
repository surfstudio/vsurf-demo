//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI
import UIKit

/// Модификатор обрабатывает тап по View и вызывает скрытие клавиатуры
struct BackgroundKeyboardHideModifier: ViewModifier {

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                hideKeyboard()
            }
    }

}

// MARK: - Accessor

public extension View {

    /// Модификатор обрабатывает тап по View и вызывает скрытие клавиатуры
    func hideKeyboardOnBackgroundTap() -> some View {
        return modifier(BackgroundKeyboardHideModifier())
    }

}
