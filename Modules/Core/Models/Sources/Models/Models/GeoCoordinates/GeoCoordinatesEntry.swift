//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct GeoCoordinatesEntry: Codable {

    // MARK: - Public Properties

    public let lat: String
    public let long: String

}

// MARK: - RawMappable

extension GeoCoordinatesEntry: RawMappable {
    public typealias Raw = Json
}
