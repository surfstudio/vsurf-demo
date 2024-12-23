//
//  Copyright © Surf. All rights reserved.
//

import Combine
import Foundation

/// Протокол для показа/скрытия tabBar при необходимости получить `hidesBottomBarWhenPushed`
/// Можете передать его как `weakReference` от `AppTabBarView`
/// до следующих экранов, где будет `NavigationState` + push .
@objc
public protocol TabBarVisibilityManager {
    /// Показывает или скрывает кастомный `TabBarView`
    /// - parameter isVisible: флаг отображения TabBar
    func setTabBar(isVisible: Bool)
}

public final class TabBarVisibilityHolder: ObservableObject, TabBarVisibilityManager {

    // MARK: - Properties

    @Published public private(set) var isVisible: Bool

    // MARK: - Init

    public init(isVisible: Bool) {
        self.isVisible = isVisible
    }

    // MARK: - TabBarVisibilityManager

    public func setTabBar(isVisible: Bool) {
        self.isVisible = isVisible
    }
}
