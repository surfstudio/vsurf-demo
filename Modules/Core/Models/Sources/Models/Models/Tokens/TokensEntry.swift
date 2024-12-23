//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct TokensEntry: Codable {

    // MARK: - Public Properties

    public let access_token: String
    public let refresh_token: String

}

// MARK: - RawMappable

extension TokensEntry: RawMappable {
    public typealias Raw = Json
}
