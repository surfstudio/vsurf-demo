//
//  CatalogPresenter.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public class CatalogPresenter: ObservableObject, CatalogViewOutput {

    // MARK: - Properties

    var onShowDetail: ((Item) -> Void)?
    var onCartShow: (() -> Void)?

    let model: Model

    @Published var allItems: [Item] = []

    @Published var cartItems: [Item] = []

    // MARK: - Init

    init(model: Model) {
        self.model = model

        model.all
            .assign(to: &$allItems)

        model.cart
            .assign(to: &$cartItems)
    }

    // MARK: - CatalogViewOutput

    func addItem(_ item: Item) {
        model.addItem(item)
    }

    func removeItem(_ item: Item) {
        model.removeItem(item)
    }

    func showDetail(_ item: Item) {
        onShowDetail?(item)
    }

    func showCart() {
        onCartShow?()
    }

}
