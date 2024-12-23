//
//  Copyright © Surf. All rights reserved.
//

import Combine

public final class Model {

    // MARK: - Properties

    private var allItems: CurrentValueSubject<[Item], Never>

    private var cartItems: CurrentValueSubject<[Item], Never>

    public var all: AnyPublisher<[Item], Never> {
        allItems.eraseToAnyPublisher()
    }

    public var cart: AnyPublisher<[Item], Never> {
        cartItems.eraseToAnyPublisher()
    }

    // MARK: - Init

    public init() {
        self.allItems = CurrentValueSubject([
            "Item 1",
            "Item 2",
            "Item 3",
            "Item 4",
            "Item 5",
            "Item 6",
            "Item 7",
            "Item 8",
            "Item 9",
            "Item 10"
        ].map { Item(title: $0) })
        self.cartItems = CurrentValueSubject([])
    }

    // MARK: - Input

    public func addItem(_ item: Item) {
        cartItems.send(cartItems.value + [item])
    }

    public func removeItem(_ item: Item) {
        var cartItems = self.cartItems.value
        if let itemIndex = cartItems.firstIndex(of: item) {
            cartItems.remove(at: itemIndex)
            self.cartItems.send(cartItems)
        }
    }

    public func removeAll() {
        cartItems.send([])
    }
}
