//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct RefreshTokenRequestEntity {

    // MARK: - Public Properties

    /// Refresh-токен
    public let token: String

    // MARK: - Initialization

    public init(token: String) {
        self.token = token
    }

}

// MARK: - DTOConvertible

extension RefreshTokenRequestEntity: DTOConvertible {
    public static func from(dto model: RefreshTokenRequestEntry) throws -> RefreshTokenRequestEntity {
        return .init(token: model.token)
    }

    public func toDTO() throws -> RefreshTokenRequestEntry {
        return .init(token: token)
    }
}
