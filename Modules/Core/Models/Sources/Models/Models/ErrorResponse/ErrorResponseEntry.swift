//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct ErrorResponseEntry: Codable, Error {

    // MARK: - Public Properties

    public let code: Int
    public let data: String?
    public let error_message: String?

}

// MARK: - RawMappable

extension ErrorResponseEntry: RawMappable {
    public typealias Raw = Json
}
