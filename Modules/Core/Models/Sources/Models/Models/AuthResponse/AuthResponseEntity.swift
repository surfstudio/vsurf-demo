//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель успешной авторизации
public struct AuthResponseEntity {

    // MARK: - Public Properties

    public let tokens: TokensEntity

    public let user: UserProfileEntity

    // MARK: - Initialization

    public init(tokens: TokensEntity,
                user: UserProfileEntity) {
        self.tokens = tokens
        self.user = user
    }

}

// MARK: - DTOConvertible

extension AuthResponseEntity: DTOConvertible {
    public static func from(dto model: AuthResponseEntry) throws -> AuthResponseEntity {
        return try .init(tokens: .from(dto: model.tokens),
                         user: .from(dto: model.user))
    }

    public func toDTO() throws -> AuthResponseEntry {
        return try .init(tokens: tokens.toDTO(),
                         user: user.toDTO())
    }
}
