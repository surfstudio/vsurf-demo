//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public extension View {

    /// - parameter source: Источник изображения.
    /// - returns: `Image` или `AsyncImage` которое само грузит картинку из интеренета
    @ViewBuilder
    func someImage(from source: ImageSource) -> some View {
        switch source {
        case .resource(let asset):
            Image(asset: asset)
                .resizable()
        case .url(let url):
            AsyncImage(url: url)
        }
    }

    /// - parameter source: Источник изображения.
    /// - parameter placeholder: `View`, демонстрируемое на время загрузки изображения.
    /// - returns: `Image` или `AsyncImage` которое само грузит картинку из интеренета
    @ViewBuilder
    func someImage(from source: ImageSource,
                   @ViewBuilder placeholder: @escaping (AsyncImagePhase) -> some View) -> some View {
        switch source {
        case .resource(let asset):
            Image(asset: asset)
                .resizable()
        case .url(let url):
            AsyncImage(url: url, content: placeholder)
        }
    }

}
