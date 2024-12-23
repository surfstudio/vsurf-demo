//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

/// Протокол для конфигурации `Label` внутри кастомных вьюшек.
/// Убирает ограничения системного инициализатора с `titleKey` и `systemImage`.
public protocol LabelRepresentable {
    /// Текст внутри `Label`
    var title: String { get }
    /// Изображение внутри `Label`
    var image: ImageAsset { get }
}
