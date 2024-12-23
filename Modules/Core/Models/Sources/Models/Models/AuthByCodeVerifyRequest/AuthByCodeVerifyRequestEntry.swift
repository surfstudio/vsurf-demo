//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct AuthByCodeVerifyRequestEntry: Codable {

    // MARK: - Public Properties

    public let code: String
    public let phone: String

}

// MARK: - RawMappable

extension AuthByCodeVerifyRequestEntry: RawMappable {
    public typealias Raw = Json
}
