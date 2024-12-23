//
//  DetailsInteractor.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine

final class DetailsInteractor {

    let model: Model
    let itemId: String

    var item: AnyPublisher<CatalogItem, Never> {
        Publishers.CombineLatest(model.all, model.cart)
            .compactMap { (items, cart) -> CatalogItem? in
                items.first { $0.title == self.itemId }.map {
                    CatalogItem(title: $0.title, canRemoveFromCart: cart.contains($0)
                    )
                }
            }.eraseToAnyPublisher()
    }

    init(model: Model, itemId: String) {
        self.model = model
        self.itemId = itemId
    }

    func addItem() {
        model.addItem(.init(title: itemId))
    }

    func removeItem() {
        model.removeItem(.init(title: itemId))
    }

}
