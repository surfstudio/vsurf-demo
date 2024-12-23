//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель телефона для авторизации
public struct AuthByCodeRequestEntity {

    // MARK: - Public Properties

    /// Номер телефона
    /// Формат передачи: только числовые символы, обернутые в строку
    public let phone: String

    // MARK: - Initialization

    public init(phone: String) {
        self.phone = phone
    }

}

// MARK: - DTOConvertible

extension AuthByCodeRequestEntity: DTOConvertible {
    public static func from(dto model: AuthByCodeRequestEntry) throws -> AuthByCodeRequestEntity {
        return .init(phone: model.phone)
    }

    public func toDTO() throws -> AuthByCodeRequestEntry {
        return .init(phone: phone)
    }
}
