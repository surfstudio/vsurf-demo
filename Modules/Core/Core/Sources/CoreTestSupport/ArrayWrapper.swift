//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Обертка над массивом, чтобы передавать его как `inout` параметр в функции для использования в `@escaping` closure
public class ArrayWrapper<T> {

    // MARK: - Private Properties

    private var array: [T] = []

    // MARK: - Computed Properties

    public var values: [T] {
        return array
    }

    // MARK: - Init

    public init() {}

    // MARK: - Methods

    public func append(_ newElement: T) {
        array.append(newElement)
    }

}
