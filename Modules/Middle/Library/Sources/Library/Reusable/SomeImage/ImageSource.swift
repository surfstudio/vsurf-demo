//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import Resources

/// Источник изображения
public enum ImageSource {
    /// Ассеты (xcasset)
    case resource(ImageAsset)
    /// Внешняя ссылка
    case url(URL)
}
