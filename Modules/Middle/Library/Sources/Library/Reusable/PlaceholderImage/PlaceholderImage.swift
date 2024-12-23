//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import Resources
import SwiftUI

public struct PlaceholderImage: View {

    // MARK: - Nested Types

    public enum Icon {
        case small
        case normal

        fileprivate var asset: ImageAsset {
            switch self {
            case .small:
                return Asset.Images.Icons.Camera.small
            case .normal:
                return Asset.Images.Icons.Camera.normal
            }
        }
    }

    // MARK: - Environment

    @Environment(\.placeholderImageStyle)
    var style

    // MARK: - Initialization

    public init() {}

    // MARK: - Body

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(style.backgroundColor)
            Image(asset: style.icon.asset)
                .renderingMode(.template)
                .foregroundStyle(style.iconTintColor)
        }
    }

}

// MARK: - Preview

struct PlaceholderImage_Previews: PreviewProvider {

    enum Preset: String, CaseIterable {
        case regular
    }

    static var previews: some View {
        snapshots.previews
    }

    static var snapshots: PreviewSnapshots<Preset> {
        return PreviewSnapshots(states: Preset.allCases,
                                name: \.rawValue,
                                configure: { preset in
            switch preset {
            case .regular:
                PlaceholderImage()
                    .placeholderImageStyle(.regular)
            }
        })
    }
}
