//
//  CartViewStateHolder.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Cart
import Combine
import Foundation
import VSURFState

final class CartViewStateHolder: ObservableObject {

    // MARK: - Private Properties

    private var cancellables: Set<AnyCancellable> = []
    private var cartUnit: CartUnitInput & CartUnitOutput

    // MARK: - Published

    @Published var state: CartView.ViewState = .init(items: [])

    // MARK: - Init

    init(cartUnit: CartUnitInput & CartUnitOutput) {
        self.cartUnit = cartUnit
        subscribe()
    }

}

// MARK: - ViewOutput

extension CartViewStateHolder: CartViewOutput {

    func buy() {
        cartUnit.removeAll()
    }

}

// MARK: - Private Methods

private extension CartViewStateHolder {

    func subscribe() {

        cartUnit.items
            .map { cartItems -> [(String, Int)] in
                cartItems.reduce(into: [Item: Int]()) { result, item in
                    result.updateValue((result[item] ?? 0) + 1, forKey: item)
                }
                .sorted(by: { $0.key.title > $1.key.title })
                .compactMap { ($0.key.title, $0.value) }
            }
            .receive(on: DispatchQueue.main)
            .map { items -> CartView.ViewState in
                CartView.ViewState(items: items.map { (item, count) -> CartView.CartItem in
                        .init(title: item, count: count)
                })
            }
            .assign(to: \.state, on: self)
            .store(in: &cancellables)

    }

}
