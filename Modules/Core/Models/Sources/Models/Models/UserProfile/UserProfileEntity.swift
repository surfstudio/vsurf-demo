//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit
import SurfMacros

/// Модель пользовательских данных авторизованного пользователя
@ObjcBridge
public struct UserProfileEntity: Codable {

    // MARK: - Public Properties

    /// Дата рождения пользователя.
    public let birthday: Date?

    /// Почта пользователя.
    public let email: String?

    /// Имя пользователя.
    public let firstName: String?

    /// Идентификатор пользователя в системе
    public let id: String

    /// Фамилия пользователя.
    public let lastName: String?

    /// Номер телефона
    /// Формат передачи: только числовые символы, обернутые в строку
    public let phone: String

    /// Пол пользователя.
    public let sex: SexType?

    // MARK: - Initialization

    public init(birthday: Date?,
                email: String?,
                firstName: String?,
                id: String,
                lastName: String?,
                phone: String,
                sex: SexType?) {
        self.birthday = birthday
        self.email = email
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.phone = phone
        self.sex = sex
    }

}

// MARK: - DTOConvertible

extension UserProfileEntity: DTOConvertible {
    public static func from(dto model: UserProfileEntry) throws -> UserProfileEntity {
        return .init(birthday: DateFormatter.defaultServerDate.date(from: model.birthday),
                     email: model.email,
                     firstName: model.first_name,
                     id: model.id,
                     lastName: model.last_name,
                     phone: model.phone,
                     sex: model.sex)
    }

    public func toDTO() throws -> UserProfileEntry {
        return .init(birthday: DateFormatter.defaultServerDate.string(fromOptionalDate: birthday),
                     email: email,
                     first_name: firstName,
                     id: id,
                     last_name: lastName,
                     phone: phone,
                     sex: sex)
    }
}
