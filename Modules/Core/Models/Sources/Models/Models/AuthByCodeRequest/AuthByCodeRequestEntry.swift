//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct AuthByCodeRequestEntry: Codable {

    // MARK: - Public Properties

    public let phone: String

}

// MARK: - RawMappable

extension AuthByCodeRequestEntry: RawMappable {
    public typealias Raw = Json
}
