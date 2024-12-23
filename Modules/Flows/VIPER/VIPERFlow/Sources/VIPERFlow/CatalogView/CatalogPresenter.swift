//
//  CatalogPresenter.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import SwiftUI
import Combine

final class CatalogPresenter: ObservableObject {

    // MARK: - Private Properties

    private let router: CatalogRouter
    private let interactor: CatalogInteractor

    // MARK: - Published

    @Published var items: [CatalogItem] = []
    @Published var cartTotal: Int = 0

    // MARK: - Init

    init(interactor: CatalogInteractor,
         router: CatalogRouter) {
        self.interactor = interactor
        self.router = router
        self.subscribe()
    }

    // MARK: - Actions

    func addItem(_ item: CatalogItem) {
        interactor.addItem(item)
    }

    func removeItem(_ item: CatalogItem) {
        interactor.removeItem(item)
    }

    // MARK: - Subscribtion

    func subscribe() {

        Publishers.CombineLatest(
            interactor.model.all,
            interactor.model.cart
        ).map { (all, cart) -> [CatalogItem] in
            all.map { item in
                CatalogItem(title: item.title, canRemoveFromCart: cart.contains(item)
                )
            }
        }
        .assign(to: &$items)

        interactor.model.cart
            .map { $0.count }
            .assign(to: &$cartTotal)
    }

    // MARK: - Navigation

    func cartLinkBuilder<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeCartView(using: interactor.model),
            label: content
        )
    }

    func buildDetails(for item: CatalogItem) -> some View {
        router.makeDetailView(for: item,
                              using: interactor.model)
    }
}
