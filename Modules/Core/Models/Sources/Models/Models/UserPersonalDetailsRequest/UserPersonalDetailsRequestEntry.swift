//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct UserPersonalDetailsRequestEntry: Codable {

    // MARK: - Public Properties

    public let birthday: String?
    public let email: String?
    public let first_name: String?
    public let last_name: String?
    public let sex: SexType?

}

// MARK: - RawMappable

extension UserPersonalDetailsRequestEntry: RawMappable {
    public typealias Raw = Json
}
