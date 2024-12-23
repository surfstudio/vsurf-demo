//
//  CartPresenter.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

final class CartPresenter: ObservableObject, CartViewOutput {

    // MARK: - Properties

    let model: Model

    var onBuy: (() -> Void)?

    // MARK: - Input

    @Published var cartItems: [(Item, Int)] = []

    // MARK: - Init

    init(model: Model) {
        self.model = model

        model.cart
            .map { cartItems in
                cartItems.reduce(into: [Item: Int]()) { result, item in
                    result.updateValue((result[item] ?? 0) + 1, forKey: item)
                }
                .sorted(by: { $0.key.title > $1.key.title })
                .compactMap { ($0.key, $0.value) }
            }
            .assign(to: &$cartItems)
    }

    // MARK: - CartViewOutput

    func buy() {
        model.removeAll()
        onBuy?()
    }

}
