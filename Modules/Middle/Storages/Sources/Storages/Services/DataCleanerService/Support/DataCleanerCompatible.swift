//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Mockable

/// Протокол для хранилищ, которые совместимы с DataCleaner-сервисом,
/// и которые можно подключить к нему, чтобы сервис удалял из хранилищ данные
/// при наступлении того или иного события
@Mockable
public protocol DataCleanerCompatible: AnyObject {
    /// Вызов метода приводит к очистке хранящихся данных
    func clean()
}
