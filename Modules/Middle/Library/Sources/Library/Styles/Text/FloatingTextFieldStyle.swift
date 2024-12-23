//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public protocol FloatingTextFieldStyle {

    associatedtype BackgroundView: View

    var textFont: SwiftUI.Font { get }
    var hintFont: SwiftUI.Font { get }
    var floatingHintFont: SwiftUI.Font { get }
    var errorFont: SwiftUI.Font { get }
    var errorColor: ColorAsset { get }
    var hintColor: ColorAsset { get }
    var textColors: [TextFieldState: ColorAsset] { get }
    var backgroundColors: [TextFieldState: ColorAsset] { get }

    @ViewBuilder
    func makeContent(_ container: AnyView, for fieldState: TextFieldState) -> Self.BackgroundView
}

public enum FloatingTextFieldStyleKey: EnvironmentKey {
    public static var defaultValue: any FloatingTextFieldStyle = .rounded
}

public extension EnvironmentValues {
    var floatingTextFieldStyle: any FloatingTextFieldStyle {
        get { self[FloatingTextFieldStyleKey.self] }
        set { self[FloatingTextFieldStyleKey.self] = newValue }
    }
}
