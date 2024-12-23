//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель времени жизни кода авторизации
public struct AuthByCodeResponseEntity {

    // MARK: - Public Properties

    /// Время жизни кода для авторизации в секундах
    public let codeLifetime: Int

    // MARK: - Initialization

    public init(codeLifetime: Int) {
        self.codeLifetime = codeLifetime
    }

}

// MARK: - DTOConvertible

extension AuthByCodeResponseEntity: DTOConvertible {
    public static func from(dto model: AuthByCodeResponseEntry) throws -> AuthByCodeResponseEntity {
        return .init(codeLifetime: model.code_lifetime)
    }

    public func toDTO() throws -> AuthByCodeResponseEntry {
        return .init(code_lifetime: codeLifetime)
    }
}
