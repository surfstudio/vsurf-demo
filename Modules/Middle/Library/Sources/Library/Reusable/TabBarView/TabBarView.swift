//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

public struct TabBarView<Item: Hashable & LabelRepresentable>: View {

    // MARK: - Properties

    @Environment(\.tabBarViewStyle)
    private var style

    let items: [Item]

    @Binding var selectedItem: Item

    // MARK: - Init

    public init(items: [Item], selectedItem: Binding<Item>) {
        self.items = items
        self._selectedItem = selectedItem
    }

    // MARK: - Body

    public var body: some View {
        AnyView(style.makeContainer(AnyView(
            HStack {
                ForEach(items, id: \.self) { item in
                    let isSelected = selectedItem.hashValue == item.hashValue
                    Button {
                        selectedItem = item
                    } label: {
                        AnyView(style.makeItem(
                            TabItemView(item: item),
                            isActive: isSelected)
                        )
                    }.accessibilityAddTraits(isSelected ? [.isSelected, .isButton] : .isButton)
                }
            }
        ))
        )
    }

}

// MARK: - Preview

struct TabBarView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case classic
        case rounded
    }

    enum StubItem: Int, LabelRepresentable, CaseIterable {

        case main
        case profile

        var title: String {
            switch self {
            case .main:
                return L10n.Localizable.Shared.Tabbar.main
            case .profile:
                return L10n.Localizable.Shared.Tabbar.profile
            }
        }

        var image: ImageAsset {
            switch self {
            case .main:
                return Asset.Images.TabBar.main
            case .profile:
                return Asset.Images.TabBar.profile
            }
        }
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .classic:
                TabBarView(items: StubItem.allCases,
                           selectedItem: .constant(StubItem.profile))
                .tabBarViewStyle(.classic)
            case .rounded:
                TabBarView(items: StubItem.allCases,
                           selectedItem: .constant(StubItem.main))
                .tabBarViewStyle(.rounded)
            }
        })
    }
}
