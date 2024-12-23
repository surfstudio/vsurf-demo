import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

public struct CatalogView: View {

    // MARK: - Nested Types

    struct CatalogItem {
        let title: String
        let canRemoveFromCart: Bool
    }

    struct CartSnapshot {
        let count: Int

        var isEmpty: Bool {
            // swiftlint:disable:next empty_count
            count == 0
        }
    }

    struct ViewState {
        let items: [CatalogItem]
        let cart: CartSnapshot
    }

    // MARK: - States

    @Binding private var state: ViewState
    @Binding private var navigationState: VSURFNavigationState
    @Binding private var detailSelected: String?

    // MARK: - Weak Reference

    @WeakReference private var output: CatalogViewOutput?

    // MARK: - Init

    init(state: Binding<ViewState>,
         navigationState: Binding<VSURFNavigationState>,
         detailSelected: Binding<String?>) {
        _state = state
        _navigationState = navigationState
        _detailSelected = detailSelected
    }

    // MARK: - Body

    public var body: some View {
        List {
            ForEach(state.items, id: \.title) { item in
                Button(action: {
                    detailSelected = item.title
                }, label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            output?.removeItem(item.title)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .disabled(!item.canRemoveFromCart)
                        Button(action: {
                            output?.addItem(item.title)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
            }
        }.toolbar {
            Button(action: {
                navigationState.push(destination: .cart)
            }, label: {
                Image(systemName: "cart")
                Text("\(state.cart.count)")
            })
            .disabled(state.cart.isEmpty)
        }
    }

}

// MARK: - Preview

struct CatalogView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case cartIsEmpty
        case cartIsNotEmpty
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .cartIsEmpty:
                CatalogView(state: .constant(.init(items: [
                    .init(title: "Item 1", canRemoveFromCart: false),
                    .init(title: "Item 2", canRemoveFromCart: false),
                    .init(title: "Item 3", canRemoveFromCart: false)
                ], cart: .init(count: 0))),
                            navigationState: .constant(.initial),
                            detailSelected: .constant(nil))
            case .cartIsNotEmpty:
                CatalogView(state: .constant(.init(items: [
                    .init(title: "Item 1", canRemoveFromCart: true),
                    .init(title: "Item 2", canRemoveFromCart: true),
                    .init(title: "Item 3", canRemoveFromCart: true)
                ], cart: .init(count: 3))),
                            navigationState: .constant(.initial),
                            detailSelected: .constant(nil))
            }
        })
    }
}
