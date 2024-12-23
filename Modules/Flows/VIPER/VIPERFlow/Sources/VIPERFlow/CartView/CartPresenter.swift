//
//  CartPresenter.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine

final class CartPresenter: ObservableObject {

    // MARK: - Private Properties

    private let interactor: CartInteractor

    // MARK: - Input

    @Published var items: [(String, Int)] = []

    // MARK: - Init

    init(interactor: CartInteractor) {
        self.interactor = interactor
        self.subscribe()
    }

    // MARK: - Actions

    func buy() {
        interactor.buy()
    }

    // MARK: - Subscribtion

    func subscribe() {
        interactor.model.cart
            .map { cartItems in
                cartItems.reduce(into: [String: Int]()) { result, item in
                    result.updateValue((result[item.title] ?? 0) + 1, forKey: item.title)
                }
                .sorted(by: { $0.key > $1.key })
                .compactMap { ($0.key, $0.value) }
            }
            .assign(to: &$items)
    }

}
