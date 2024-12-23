//
//  Copyright © Surf. All rights reserved.
//

import Foundation

public protocol SearchItem: Hashable {

    associatedtype ID: Hashable

    var id: ID { get }
    var name: String { get }
    var isSelected: Bool { get }

}
