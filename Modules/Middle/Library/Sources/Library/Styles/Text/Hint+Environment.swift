//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

public enum HintKey: EnvironmentKey {
    public static var defaultValue = ""
}

public enum SecondaryHintKey: EnvironmentKey {
    public static var defaultValue = " "
}

public extension EnvironmentValues {
    /// Основная подсказка для кастомных полей ввода
    var hint: String {
        get { self[HintKey.self] }
        set { self[HintKey.self] = newValue }
    }

    /// Дополнительная подсказка для кастомных полей ввода
    var secondaryHint: String {
        get { self[SecondaryHintKey.self] }
        set { self[SecondaryHintKey.self] = newValue }
    }
}

public extension View {
    /// Устанавливает основную подсказку для кастомных полей ввода
    func hint(_ hint: String) -> some View {
        self.environment(\.hint, hint)
    }

    /// Устанавливает дополнительную подсказку для кастомных полей ввода
    func secondaryHint(_ hint: String) -> some View {
        self.environment(\.secondaryHint, hint)
    }
}
