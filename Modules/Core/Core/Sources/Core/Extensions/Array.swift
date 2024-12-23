//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public extension Array {

    /// - parameter index: индекс элемента массива
    /// - returns: элемент массива по индексу, если индекс в пределах массива, иначе nil
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }

}
