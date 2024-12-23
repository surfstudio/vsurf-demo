//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель для подтверждения кода OTP
public struct AuthByCodeVerifyRequestEntity {

    // MARK: - Public Properties

    /// Код подтверждения
    public let code: String

    /// Номер телефона
    public let phone: String

    // MARK: - Initialization

    public init(code: String,
                phone: String) {
        self.code = code
        self.phone = phone
    }

}

// MARK: - DTOConvertible

extension AuthByCodeVerifyRequestEntity: DTOConvertible {
    public static func from(dto model: AuthByCodeVerifyRequestEntry) throws -> AuthByCodeVerifyRequestEntity {
        return .init(code: model.code,
                     phone: model.phone)
    }

    public func toDTO() throws -> AuthByCodeVerifyRequestEntry {
        return .init(code: code,
                     phone: phone)
    }
}
