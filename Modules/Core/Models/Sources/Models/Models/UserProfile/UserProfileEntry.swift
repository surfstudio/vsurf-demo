//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct UserProfileEntry: Codable {

    // MARK: - Public Properties

    public let birthday: String?
    public let email: String?
    public let first_name: String?
    public let id: String
    public let last_name: String?
    public let phone: String
    public let sex: SexType?

}

// MARK: - RawMappable

extension UserProfileEntry: RawMappable {
    public typealias Raw = Json
}
