//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Модель описания города
public struct CityEntity: Codable {

    // MARK: - Public Properties

    public let id: String

    /// Город
    public let name: String

    public let position: GeoCoordinatesEntity

    // MARK: - Initialization

    public init(id: String,
                name: String,
                position: GeoCoordinatesEntity) {
        self.id = id
        self.name = name
        self.position = position
    }

}

// MARK: - DTOConvertible

extension CityEntity: DTOConvertible {
    public static func from(dto model: CityEntry) throws -> CityEntity {
        return try .init(id: model.id,
                         name: model.name,
                         position: .from(dto: model.position))
    }

    public func toDTO() throws -> CityEntry {
        return try .init(id: id,
                         name: name,
                         position: position.toDTO())
    }
}
