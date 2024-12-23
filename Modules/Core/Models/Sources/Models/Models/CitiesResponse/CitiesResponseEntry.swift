//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct CitiesResponseEntry: Codable {

    // MARK: - Public Properties

    public let cities: [CityEntry]

}

// MARK: - RawMappable

extension CitiesResponseEntry: RawMappable {
    public typealias Raw = Json
}
