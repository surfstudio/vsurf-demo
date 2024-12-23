import PreviewSnapshots
import VSURFState
import Resources
import SwiftUI

public struct VSURFViewGroup: View {

    // MARK: - State

    @State private var navigationState: VSURFNavigationState = .initial
    @StateObject private var catalogStateHolder: CatalogViewStateHolder
    @StateObject private var cartStateHolder: CartViewStateHolder
    @State private var detailSelected: String?

    // MARK: - Private Properties

    private let catalogUnit: CatalogUnitOutput
    private let cartUnit: CartUnitInput & CartUnitOutput

    // MARK: - Init

    public init() {
        let catalogUnit = VSURFStateFacade.Units.catalog()
        let cartUnit = VSURFStateFacade.Units.cart()
        self.catalogUnit = catalogUnit
        self.cartUnit = cartUnit
        self._catalogStateHolder = .init(wrappedValue: .init(catalogUnit: catalogUnit, cartUnit: cartUnit))
        self._cartStateHolder = .init(wrappedValue: .init(cartUnit: cartUnit))
    }

    // MARK: - View

    public var body: some View {
        NavigationStack(path: $navigationState.navigationPath) {
            CatalogView(state: $catalogStateHolder.state,
                        navigationState: $navigationState,
                        detailSelected: $detailSelected)
            .navigationTitle("Items")
            .navigationDestination(for: VSURFNavigationState.Destination.self) { destination in
                switch destination {
                case .cart:
                    CartView(state: $cartStateHolder.state,
                             navigationState: $navigationState)
                    .navigationTitle("Cart")
                }
            }
        }
        .sheet(item: $detailSelected) { item in
            DetailViewGroup(item: item, cartUnit: cartUnit)
        }
        .weakReference(cartStateHolder, as: CartViewOutput.self)
        .weakReference(catalogStateHolder, as: CatalogViewOutput.self)

    }

}

// MARK: - Identifiable

extension String: Identifiable {

    public var id: String {
        self
    }

}
