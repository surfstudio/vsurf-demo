//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SurfCore
import SwiftUI

public extension ToolbarItem where ID == (), Content == AnyView {

    enum Item {
        case close
        case search

        fileprivate var imageAsset: ImageAsset {
            switch self {
            case .close:
                return Asset.Images.Icons.close
            case .search:
                return Asset.Images.Icons.search
            }
        }

        fileprivate var color: Color {
            switch self {
            case .close:
                return Asset.Colors.Icons.primary.color
            case .search:
                return Asset.Colors.NavigationBar.primaryTint.color
            }
        }

        fileprivate var placement: ToolbarItemPlacement {
            switch self {
            case .close, .search:
                return .topBarTrailing
            }
        }

    }

    init(item: Item, action: @escaping EmptyClosure) {
        self.init(placement: item.placement) {
            AnyView(
                Button(action: action) {
                    Image(asset: item.imageAsset)
                        .renderingMode(.template)
                        .foregroundStyle(item.color)
                }
            )
        }
    }

}
