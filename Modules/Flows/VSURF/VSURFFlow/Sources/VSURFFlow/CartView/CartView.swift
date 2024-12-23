import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

public struct CartView: View {

    // MARK: - Nested types

    struct CartItem {
        let title: String
        let count: Int
    }

    struct ViewState {
        let items: [CartItem]
    }

    // MARK: - States

    @Binding private var state: ViewState
    @Binding private var navigationState: VSURFNavigationState

    // MARK: - Weak Reference

    @WeakReference private var output: CartViewOutput?

    // MARK: - Init

    init(state: Binding<ViewState>,
         navigationState: Binding<VSURFNavigationState>) {
        _state = state
        _navigationState = navigationState
    }

    // MARK: - Body

    public var body: some View {
        ForEach(state.items, id: \.title) { item in
            HStack {
                Text(item.title)
                Text("\(item.count)")
            }
        }
        Divider()
        Button(action: {
            output?.buy()
            navigationState.pop()
        }, label: {
            Text("Buy all")
        })
    }

}

// MARK: - Preview

struct CartView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case `default`
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .`default`:
                CartView(state: .constant(.init(items: [
                    .init(title: "Item 1", count: 1),
                    .init(title: "Item 2", count: 2),
                    .init(title: "Item 3", count: 3)
                ])),
                         navigationState: .constant(.initial)
                )
            }
        })
    }
}
