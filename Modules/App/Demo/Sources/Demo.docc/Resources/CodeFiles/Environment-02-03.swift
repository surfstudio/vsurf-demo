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
                            Label(
                                title: {
                                    Text(item.title)
                                },
                                icon: {
                                    Image(asset: item.image).renderingMode(.template)
                                }
                            ),
                            isActive: isSelected)
                        )
                    }.accessibilityAddTraits(isSelected ? [.isSelected, .isButton] : .isButton)
                }
            }
        ))
        )
    }

}
