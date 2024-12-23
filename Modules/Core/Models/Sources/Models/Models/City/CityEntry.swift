//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct CityEntry: Codable {

    // MARK: - Public Properties

    public let id: String
    public let name: String
    public let position: GeoCoordinatesEntry

}

// MARK: - RawMappable

extension CityEntry: RawMappable {
    public typealias Raw = Json
}
