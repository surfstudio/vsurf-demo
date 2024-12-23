//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct RefreshTokenRequestEntry: Codable {

    // MARK: - Public Properties

    public let token: String

}

// MARK: - RawMappable

extension RefreshTokenRequestEntry: RawMappable {
    public typealias Raw = Json
}
