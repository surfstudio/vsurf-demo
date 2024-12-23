//
//  DetailsPresenter.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Combine
import SwiftUI

public class DetailsPresenter: ObservableObject {

    // MARK: - Private Properties

    private let interactor: DetailsInteractor

    // MARK: - Published

    @Published var item: CatalogItem = .init(title: "",
                                             canRemoveFromCart: false)

    @Published var cartCount = 0

    // MARK: - Init

    init(interactor: DetailsInteractor) {
        self.interactor = interactor
        self.subscribe()
    }

    // MARK: - Actions

    func addItem() {
        interactor.addItem()
    }

    func removeItem() {
        interactor.removeItem()
    }

    // MARK: - Subscribtion

    func subscribe() {

        interactor.item
            .assign(to: &$item)

        interactor.model.cart
            .combineLatest($item)
            .map { cart, item in
                cart.filter { $0.id == item.id }.count
            }
            .assign(to: &$cartCount)
    }

}
