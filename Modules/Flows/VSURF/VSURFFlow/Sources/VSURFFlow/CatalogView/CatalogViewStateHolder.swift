//
//  CatalogViewStateHolder.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Combine
import Foundation
import VSURFState

final class CatalogViewStateHolder: ObservableObject {

    // MARK: - Private Properties

    private var cancellables: Set<AnyCancellable> = []
    private var catalogUnit: CatalogUnitOutput
    private var cartUnit: CartUnitInput & CartUnitOutput

    // MARK: - Published

    @Published var state: CatalogView.ViewState = .init(items: [],
                                                        cart: .init(count: 0)
    )

    // MARK: - Init

    init(catalogUnit: CatalogUnitOutput, cartUnit: CartUnitInput & CartUnitOutput) {
        self.catalogUnit = catalogUnit
        self.cartUnit = cartUnit
        subscribe()
    }

}

// MARK: - ViewOutput

extension CatalogViewStateHolder: CatalogViewOutput {

    func addItem(_ item: String) {
        cartUnit.addItem(.init(title: item))
    }

    func removeItem(_ item: String) {
        cartUnit.removeItem(.init(title: item))
    }

}

// MARK: - Private Methods

private extension CatalogViewStateHolder {

    func subscribe() {

        Publishers.CombineLatest(catalogUnit.items, cartUnit.items)
            .receive(on: DispatchQueue.main)
            .map { (items, cartItems) -> CatalogView.ViewState in
                    .init(items: items.map { item in
                            .init(title: item.title, canRemoveFromCart: cartItems.contains(item)
                            )
                    },
                          cart: .init(count: cartItems.count)
                    )
            }
            .assign(to: \.state, on: self)
            .store(in: &cancellables)

    }

}
