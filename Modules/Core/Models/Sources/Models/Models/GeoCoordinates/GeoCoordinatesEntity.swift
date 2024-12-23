//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

/// Гео-координаты
public struct GeoCoordinatesEntity: Codable, Equatable {

    // MARK: - Public Properties

    /// Широта
    public let lat: String

    /// Долгота
    public let long: String

    // MARK: - Initialization

    public init(lat: String,
                long: String) {
        self.lat = lat
        self.long = long
    }

}

// MARK: - DTOConvertible

extension GeoCoordinatesEntity: DTOConvertible {
    public static func from(dto model: GeoCoordinatesEntry) throws -> GeoCoordinatesEntity {
        return .init(lat: model.lat,
                     long: model.long)
    }

    public func toDTO() throws -> GeoCoordinatesEntry {
        return .init(lat: lat,
                     long: long)
    }
}
