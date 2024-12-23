//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import SwiftUI

public protocol PlaceholderImageStyle {

    var icon: PlaceholderImage.Icon { get }
    var iconTintColor: Color { get }
    var backgroundColor: Color { get }

}

public enum PlaceholderImageStyleKey: EnvironmentKey {
    public static var defaultValue: any PlaceholderImageStyle = .regular
}

public extension EnvironmentValues {
    var placeholderImageStyle: any PlaceholderImageStyle {
        get { self[PlaceholderImageStyleKey.self] }
        set { self[PlaceholderImageStyleKey.self] = newValue }
    }
}
