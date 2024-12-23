//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель пары авторизационных токенов access-refresh
public struct TokensEntity: Codable {

    // MARK: - Public Properties

    /// Access-token для доступа к ресурсам сервера для авторизованного пользователя
    public let accessToken: String

    /// Refresh-token для обновление access-токена
    public let refreshToken: String

    // MARK: - Initialization

    public init(accessToken: String,
                refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }

}

// MARK: - DTOConvertible

extension TokensEntity: DTOConvertible {
    public static func from(dto model: TokensEntry) throws -> TokensEntity {
        return .init(accessToken: model.access_token,
                     refreshToken: model.refresh_token)
    }

    public func toDTO() throws -> TokensEntry {
        return .init(access_token: accessToken,
                     refresh_token: refreshToken)
    }
}
