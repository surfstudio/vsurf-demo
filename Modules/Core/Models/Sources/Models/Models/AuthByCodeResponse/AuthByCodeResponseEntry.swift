//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import NodeKit

public struct AuthByCodeResponseEntry: Codable {

    // MARK: - Public Properties

    public let code_lifetime: Int

}

// MARK: - RawMappable

extension AuthByCodeResponseEntry: RawMappable {
    public typealias Raw = Json
}
