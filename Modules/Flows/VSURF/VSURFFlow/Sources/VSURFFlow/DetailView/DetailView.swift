import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

public struct DetailView: View {

    // MARK: - Nested types

    struct ViewState {
        let title: String
        let cartCount: Int
        let canRemoveFromCart: Bool
    }

    // MARK: - States

    @Binding private var state: ViewState

    // MARK: - Weak Reference

    @WeakReference private var output: DetailViewOutput?

    // MARK: - Init

    init(state: Binding<ViewState>) {
        _state = state
    }

    // MARK: - Body

    public var body: some View {
        VStack {
            Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(alignment: .center) { Text(state.title)
                    }
            Text("\(state.cartCount) in cart")
                .padding(16)
            Button(action: {
                output?.addItem()
            }, label: {
                Text("Add to cart")
            }).padding(16)
            Button(action: {
                output?.removeItem()
            }, label: {
                Text("Remove from cart")
            }).padding(16)
                .disabled(!state.canRemoveFromCart)

        }
    }

}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {

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
                DetailView(state: .constant(.init(title: "Title", cartCount: 0, canRemoveFromCart: false))
                )
            case .cartIsNotEmpty:
                DetailView(state: .constant(.init(title: "Title", cartCount: 1, canRemoveFromCart: true))
                )
            }
        })
    }
}
