//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct AuthResponseEntry: Codable {

    // MARK: - Public Properties

    public let tokens: TokensEntry
    public let user: UserProfileEntry

}

// MARK: - RawMappable

extension AuthResponseEntry: RawMappable {
    public typealias Raw = Json
}
