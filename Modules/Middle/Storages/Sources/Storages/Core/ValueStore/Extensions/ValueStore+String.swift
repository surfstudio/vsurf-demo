//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public extension ValueStore where Value == String {

    func append(_ string: String) {
        combine(with: string, defaultValue: "", modification: { $0.appending($1) })
    }

}
