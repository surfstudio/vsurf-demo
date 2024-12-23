//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

public struct SearchBarField: View {

    // MARK: - Metrics

    @ScaledMetric private var horizontalOffset: CGFloat = 16
    @ScaledMetric private var verticalOffset: CGFloat = 12

    // MARK: - Environment

    @Environment(\.hint)
    public var hint

    // MARK: - States

    @Binding var text: String
    @FocusState var isFocused: Bool

    // MARK: - Init

    public init(query: Binding<String>) {
        self._text = query
    }

    // MARK: - Body

    public var body: some View {
        HStack {
            HStack {
                searchIcon()
                fieldView()
                if !text.isEmpty {
                    clearButton()
                }
            }
            .padding(.horizontal, horizontalOffset)
            .padding(.vertical, verticalOffset)
            .background(Asset.Colors.SearchBar.containerBackground.color)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            if isFocused {
                cancelButton()
            }
        }
        .animation(Animation.easeIn, value: text.isEmpty)
        .animation(Animation.easeIn, value: isFocused)
    }

}

// MARK: - Private

private extension SearchBarField {

    @ViewBuilder
    func searchIcon() -> some View {
        Image(asset: Asset.Images.Icons.search)
            .renderingMode(.template)
            .foregroundStyle(Asset.Colors.SearchBar.searchIcon.color)
    }

    @ViewBuilder
    func fieldView() -> some View {
        TextField(text: $text, label: {
            Text(hint)
        })
        .focused($isFocused)
    }

    @ViewBuilder
    func cancelButton() -> some View {
        Button(action: {
            text = ""
            isFocused = false
        }, label: {
            Text(L10n.Localizable.Shared.Action.cancel)
        })
        .buttonStyle(.textCancelSearch)
    }

    @ViewBuilder
    func clearButton() -> some View {
        Button(action: {
            text = ""
        }, label: {
            Image(asset: Asset.Images.Icons.clear)
                .renderingMode(.template)
                .foregroundStyle(Asset.Colors.SearchBar.clearIconBackground.color)
        })
    }

}

// MARK: - Preview

struct SearchBarField_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case empty
        case filled
    }

    static var previews: some View {
        VStack {
            snapshots.previews
        }
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .empty:
                SearchBarField(query: .constant(""))
                    .hint("Найдите то что надо")
            case .filled:
                SearchBarField(query: .constant("Аа"))
                    .hint("Найдите то что надо")
            }
        })
    }
}
