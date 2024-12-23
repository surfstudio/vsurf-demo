//
//  CartUnit.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Combine
import Cart

final class CartUnit {

    // MARK: - Private Properties

    private let model: Model

    // MARK: - Init

    init(model: Model) {
        self.model = model
    }

}

// MARK: - CartUnitInput

extension CartUnit: CartUnitInput {

    func addItem(_ item: Item) {
        model.addItem(item)
    }

    func removeItem(_ item: Item) {
        model.removeItem(item)
    }

    func removeAll() {
        model.removeAll()
    }
}

// MARK: - CartUnitOutput

extension CartUnit: CartUnitOutput {

    var items: AnyPublisher<[Item], Never> {
        model.cart
    }

}
