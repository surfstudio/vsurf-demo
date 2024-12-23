//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

/// Вьюшка с полем поиска и **multi-state** результатом.
public struct AbstractSearchView<Item: SearchItem>: View {

    // MARK: - State

    @Binding var state: UniversalViewState<[Item]>
    @Binding var query: String

    // MARK: - Private Properties

    private let onSelect: Closure<Item>?

    // MARK: - Init

    /// - Parameters:
    ///    - query: Вводимый в поле поиска текст
    ///    - state: Состояния/результат поиска
    ///    - hint: Текст подсказки для поля ввода
    ///    - keyboardType: Тип клавиатуры
    ///    - onSelect: Действие выбора одного из результатов поиска
    /// - **Схемы взаимодействия**
    ///    1. View -> `query` -> ViewStateHolder -> `state` -> View
    ///    2. View -> `onSelect` -> ViewStateHolder -> `state` -> View
    public init(query: Binding<String>,
                state: Binding<UniversalViewState<[Item]>>,
                onSelect: Closure<Item>? = nil) {
        self._query = query
        self._state = state
        self.onSelect = onSelect
    }

    // MARK: - Body

    public var body: some View {
        VStack(content: {
            fieldView()
                .padding(16)
            state.buildView {
                resultList($0)
            }
        })
    }

}

// MARK: - Private

private extension AbstractSearchView {

    @ViewBuilder
    func fieldView() -> some View {
        SearchBarField(query: $query)
    }

    @ViewBuilder
    func resultList(_ items: [Item]) -> some View {
        List {
            ForEach(items, id: \.id) { item in
                Button(action: {
                    onSelect?(item)
                }, label: {
                    HStack {
                        Text(item.name)
                        if item.isSelected {
                            Spacer()
                                .frame(maxWidth: .infinity)
                            Image(asset: Asset.Images.Icons.check)
                                .renderingMode(.template)
                                .foregroundStyle(Asset.Colors.Icons.primary.color)
                        } else {
                            EmptyView()
                        }
                    }
                })
            }.listRowSeparator(.hidden)
        }
        .font(.paragraph1)
        .foregroundColor(Asset.Colors.Text.primary.color)
        .listStyle(.plain)
    }

}

// MARK: - Preview

struct AbstractSearchView_Previews: PreviewProvider {

    struct Item: SearchItem {
        let id: Int
        let name: String
        let isSelected: Bool
    }

    enum Preset: String, CaseIterable {
        case content
        case loading
        case error
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .content:
                AbstractSearchView<Item>(query: .constant(""),
                                         state: .constant(.normal(model: [
                                            .init(id: 1,
                                                  name: "Первый",
                                                  isSelected: true),
                                            .init(id: 2,
                                                  name: "Второй",
                                                  isSelected: false),
                                            .init(id: 3,
                                                  name: "Третий",
                                                  isSelected: false)
                                         ])),
                                         onSelect: { item in
                    debugPrint("Выбран \(item.name)")
                })
                .hint("Поиск")
            case .loading:
                AbstractSearchView<Item>(query: .constant(""),
                                         state: .constant(.loading))
                .hint("Поиск")
            case .error:
                AbstractSearchView<Item>(query: .constant(""),
                                         state: .constant(.error(Exceptions.error(reason: .general,
                                                                                  action: {
                    debugPrint("Рефреш")
                }).model))
                ).hint("Поиск")
            }
        })
    }
}
