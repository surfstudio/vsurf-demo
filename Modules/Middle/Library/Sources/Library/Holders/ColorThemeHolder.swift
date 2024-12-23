//
//  Copyright © Surf. All rights reserved.
//

import Combine
import Foundation
import Resources

/// Протокол для смены темы приложения "на лету".
/// Можете передать его как `weakReference` от `ContentView` до вашего экрана настроек, где будет меняться тема.
@objc
public protocol ColorThemeManager {
    /// - parameter colorTheme: rawValue новой `ColorTheme`
    func set(colorTheme rawValue: String)
}

/// Объект для хранения и применения новой цветовой темы.
/// Подключается `@StateObject` к `ContentView` чтобы тема менялась "на лету".
public final class ColorThemeHolder: ObservableObject, ColorThemeManager {

    // MARK: - Properties

    @Published var state = ColorTheme.current

    // MARK: - Init

    /// По умолчанию инициализируется темой `ColorTheme.current`
    public init() {}

    // MARK: - ColorThemeManager

    public func set(colorTheme rawValue: String) {
        guard let colorTheme = ColorTheme(rawValue: rawValue) else {
            return
        }
        ColorTheme.current = colorTheme
        self.state = colorTheme
    }

}
