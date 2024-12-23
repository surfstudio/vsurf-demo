//
//  Copyright © Surf. All rights reserved.
//

public struct Item: Identifiable, Hashable {
    public let title: String

    public init(title: String) {
        self.title = title
    }

    public var id: String {
        title
    }
}
