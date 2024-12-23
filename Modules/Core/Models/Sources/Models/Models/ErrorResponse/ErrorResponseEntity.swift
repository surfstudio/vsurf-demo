//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Содержит себе всю информацию о произошедшей в логике на сервере ошибке,
/// полный список ошибок описан в /common/api.yaml
public struct ErrorResponseEntity: Error {

    // MARK: - Public Properties

    public let code: Int

    /// Вспомогательная информация об ошибке
    public let data: String?

    /// Сообщение, которое возможно будет показано на UI,
    /// либо будет использовано только для информирования разработчиков
    public let errorMessage: String?

    // MARK: - Initialization

    public init(code: Int,
                data: String?,
                errorMessage: String?) {
        self.code = code
        self.data = data
        self.errorMessage = errorMessage
    }

}

// MARK: - DTOConvertible

extension ErrorResponseEntity: DTOConvertible {
    public static func from(dto model: ErrorResponseEntry) throws -> ErrorResponseEntity {
        return .init(code: model.code,
                     data: model.data,
                     errorMessage: model.error_message)
    }

    public func toDTO() throws -> ErrorResponseEntry {
        return .init(code: code,
                     data: data,
                     error_message: errorMessage)
    }
}
