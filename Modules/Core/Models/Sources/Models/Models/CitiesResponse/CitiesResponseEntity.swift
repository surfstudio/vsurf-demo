//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct CitiesResponseEntity {

    // MARK: - Public Properties

    public let cities: [CityEntity]

    // MARK: - Initialization

    public init(cities: [CityEntity]) {
        self.cities = cities
    }

}

// MARK: - DTOConvertible

extension CitiesResponseEntity: DTOConvertible {
    public static func from(dto model: CitiesResponseEntry) throws -> CitiesResponseEntity {
        return try .init(cities: .from(dto: model.cities))
    }

    public func toDTO() throws -> CitiesResponseEntry {
        return try .init(cities: cities.toDTO())
    }
}
