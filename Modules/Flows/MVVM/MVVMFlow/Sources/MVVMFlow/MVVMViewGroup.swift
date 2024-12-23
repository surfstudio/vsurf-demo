//
//  Copyright © Surf. All rights reserved.
//

import Cart
import Combine
import PreviewSnapshots
import Resources
import SwiftUI

// MARK: - ViewGroup

public struct MVVMViewGroup: View {

    // MARK: - Properties

    private static let model: Model = .init()

    private var catalogVM: CatalogViewModel
    private var detailVM: DetailViewModel
    private var cartVM: CartViewModel

    // MARK: - State

    @State private var isCartShown = false
    @State private var detailSelected: Item?

    // MARK: - Init

    public init() {
        self.catalogVM = .init(model: MVVMViewGroup.model)
        self.detailVM = .init(model: MVVMViewGroup.model)
        self.cartVM = .init(model: MVVMViewGroup.model)
    }

    // MARK: - View

    public var body: some View {
        NavigationStack {
            CatalogView()
                .environmentObject(CatalogViewModel(model: MVVMViewGroup.model))
                .navigationDestination(isPresented: $isCartShown, destination: {
                    CartView()
                        .environmentObject(cartVM)
                })
                .navigationTitle("Items")
        }
        .sheet(item: $detailSelected) { item in
            DetailView()
                .environmentObject(detailVM)
        }
        .onAppear {
            catalogVM.onShowDetail = { item in
                self.detailVM.item = item
                self.detailSelected = item
            }
            catalogVM.onCartShow = {
                self.isCartShown = true
            }
            cartVM.onBuy = {
                self.isCartShown = false
            }
        }
    }

}
