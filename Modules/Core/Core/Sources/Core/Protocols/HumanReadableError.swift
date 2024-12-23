//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Общий протокол для ошибок, в соответствие которым можно поставить некий текст
public protocol HumanReadableError {
    /// Возвращает текст ошибки, если ошибка должна как-то отобразиться для пользователя,
    /// nil если пользователь увидеть ее не должен
    var message: String? { get }
}
