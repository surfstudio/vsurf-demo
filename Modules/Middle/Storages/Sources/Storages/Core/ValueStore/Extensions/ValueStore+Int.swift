//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public extension ValueStore where Value == Int {

    static func += (_ store: Self, _ delta: Int) {
        store.combine(with: delta, defaultValue: 0, modification: { $0 + $1 })
    }

    static func -= (_ store: Self, _ delta: Int) {
        store.combine(with: delta, defaultValue: 0, modification: { $0 - $1 })
    }

    static func *= (_ store: Self, _ delta: Int) {
        store.combine(with: delta, defaultValue: 0, modification: { $0 * $1 })
    }

}
