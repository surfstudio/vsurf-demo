//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public struct TabItemView: View {

    // MARK: - Properties

    public let title: String
    public let image: ImageAsset

    // MARK: - Init

    public init(item: LabelRepresentable) {
        self.title = item.title
        self.image = item.image
    }

    public init(title: String, image: ImageAsset) {
        self.title = title
        self.image = image
    }

    // MARK: - View

    public var body: some View {
        Label(
            title: {
                Text(title)
            },
            icon: {
                Image(asset: image).renderingMode(.template)
            }
        )
    }

}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TabItemView(title: L10n.Localizable.Shared.Tabbar.main,
                        image: Asset.Images.TabBar.main)
            TabItemView(title: L10n.Localizable.Shared.Tabbar.profile,
                        image: Asset.Images.TabBar.profile)
        }
    }
}
