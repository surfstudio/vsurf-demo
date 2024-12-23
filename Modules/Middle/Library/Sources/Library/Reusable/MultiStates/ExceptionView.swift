//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SurfCore
import SwiftUI

public struct ExceptionView: View {

    // MARK: - Nested

    public struct Action {
        let title: String
        let action: EmptyClosure

        public init(title: String, action: @escaping EmptyClosure) {
            self.title = title
            self.action = action
        }
    }

    // MARK: - Model

    public struct Model {
        let title: String
        let message: String
        let action: Action?

        public init(title: String,
                    message: String,
                    action: Action? = nil) {
            self.title = title
            self.message = message
            self.action = action
        }
    }

    var model: Model

    // MARK: - Init

    public init(model: Model) {
        self.model = model
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Spacer()
                .frame(maxHeight: .infinity)
            Text(model.title)
                .font(.headline2)
                .foregroundStyle(Asset.Colors.Text.primary.color)
            Text(model.message)
                .font(.paragraph2)
                .foregroundStyle(Asset.Colors.Text.primary.color)
            if let action = model.action {
                Button(action.title, action: action.action)
                    .buttonStyle(.secondarySmall)
                    .padding(8)
            }
            Spacer()
                .frame(maxHeight: .infinity)
        })
    }

}

// MARK: - Preview

struct ExceptionView_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case generalEmpty
        case generalError
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .generalEmpty:
                ExceptionView(model: Exceptions.empty(reason: .general).model)
            case .generalError:
                ExceptionView(model: Exceptions.error(reason: .general, action: { debugPrint("Рефреш") }).model)
            }
        })
    }
}
