//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель запроса для редактирования личных данных пользователя
public struct UserPersonalDetailsRequestEntity {

    // MARK: - Public Properties

    /// Дата рождения пользователя.
    public let birthday: Date?

    /// Почта пользователя.
    public let email: String?

    /// Имя пользователя.
    public let firstName: String?

    /// Фамилия пользователя.
    public let lastName: String?

    /// Пол пользователя.
    public let sex: SexType?

    // MARK: - Initialization

    public init(birthday: Date?,
                email: String?,
                firstName: String?,
                lastName: String?,
                sex: SexType?) {
        self.birthday = birthday
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.sex = sex
    }

}

// MARK: - DTOConvertible

extension UserPersonalDetailsRequestEntity: DTOConvertible {
    public static func from(dto model: UserPersonalDetailsRequestEntry) throws -> UserPersonalDetailsRequestEntity {
        return .init(birthday: DateFormatter.defaultServerDate.date(from: model.birthday),
                     email: model.email,
                     firstName: model.first_name,
                     lastName: model.last_name,
                     sex: model.sex)
    }

    public func toDTO() throws -> UserPersonalDetailsRequestEntry {
        return .init(birthday: DateFormatter.defaultServerDate.string(fromOptionalDate: birthday),
                     email: email,
                     first_name: firstName,
                     last_name: lastName,
                     sex: sex)
    }
}
