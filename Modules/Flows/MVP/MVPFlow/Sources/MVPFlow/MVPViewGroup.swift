//
//  Copyright © Surf. All rights reserved.
//

import Cart
import Combine
import PreviewSnapshots
import Resources
import SwiftUI

// MARK: - ViewGroup

public struct MVPViewGroup: View {

    // MARK: - Properties

    private static let model: Model = .init()

    @StateObject private var catalogPresenter: CatalogPresenter
    @StateObject private var detailPresenter: DetailPresenter
    @StateObject private var cartPresenter: CartPresenter

    // MARK: - State

    @State private var isCartShown = false
    @State private var detailSelected: Item?

    // MARK: - Init

    public init() {
        self._catalogPresenter = .init(wrappedValue: .init(model: MVPViewGroup.model))
        self._detailPresenter = .init(wrappedValue: .init(model: MVPViewGroup.model))
        self._cartPresenter = .init(wrappedValue: .init(model: MVPViewGroup.model))
    }

    // MARK: - View

    public var body: some View {
        NavigationStack {
            CatalogView(items: $catalogPresenter.allItems,
                        cart: $catalogPresenter.cartItems,
                        output: catalogPresenter)
            .navigationTitle("Items")
            .navigationDestination(isPresented: $isCartShown, destination: {
                CartView(items: $cartPresenter.cartItems,
                         output: cartPresenter)
            })
        }
        .sheet(item: $detailSelected) { item in
            DetailView(item: item,
                       cartCount: $detailPresenter.cartCount,
                       output: detailPresenter)
        }
        .onAppear {
            catalogPresenter.onShowDetail = { item in
                self.detailPresenter.item = item
                self.detailSelected = item
            }
            catalogPresenter.onCartShow = {
                self.isCartShown = true
            }
            cartPresenter.onBuy = {
                self.isCartShown = false
            }
        }
    }

}
