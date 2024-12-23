//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

/// Вьюшка для отображения элемента списка с опциональным значением и действием
public struct ListItemView: View {

    // MARK: - Nested

    /// Режим обработки действия
    public enum Action {
        /// Открытие ссылки
        case link(URL)
        /// Обычное действие
        case closure(EmptyClosure)
    }

    // MARK: - Properties

    private let title: String
    private let sideTitle: String?
    private let action: Action

    // MARK: - Init

    /// - Parameters:
    ///    - title: Заголовок
    ///    - sideTitle: Значение
    ///    - action: Действие
    public init(title: String,
                sideTitle: String?,
                action: Action) {
        self.title = title
        self.sideTitle = sideTitle
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        container(for: action, with: {
            HStack(alignment: .center) {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Asset.Colors.Text.primary.color)
                if let sideTitle {
                    Text(sideTitle)
                        .frame(alignment: .trailing)
                        .foregroundStyle(Asset.Colors.Text.secondary.color)
                }
                Image(decorative: Asset.Images.Icons.arrowRight)
                    .renderingMode(.template)
                    .foregroundStyle(Asset.Colors.Text.secondary.color)
            }
            .font(.paragraph1)
            .padding(.vertical, 8)
        })
    }

}

// MARK: - Private

private extension ListItemView {

    @ViewBuilder
    func container(for action: Action, with label: () -> some View) -> some View {
        switch action {
        case .link(let url):
            Link(destination: url, label: {
                label()
            })
        case .closure(let closure):
            Button {
                closure()
            } label: {
                label()
            }
        }
    }

}

// MARK: - Preview

struct ListItemView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case withoutValue
        case withValue
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .withValue:
                ListItemView(title: "Город",
                             sideTitle: "Воронеж",
                             action: .closure {})
            case .withoutValue:
                ListItemView(title: "Город",
                             sideTitle: nil,
                             action: .closure {})
            }
        })
    }
}
