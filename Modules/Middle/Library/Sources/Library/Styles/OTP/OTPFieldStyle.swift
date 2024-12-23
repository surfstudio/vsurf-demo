//
//  Copyright © Surf. All rights reserved.
//

import Resources
import SwiftUI

public protocol OTPFieldStyle {

    associatedtype ItemView: View

    @ViewBuilder
    func makeItem(_ field: AnyView, for state: TextFieldState) -> ItemView
}

public enum OTPFieldStyleKey: EnvironmentKey {
    public static var defaultValue: any OTPFieldStyle = .rounded
}

public extension EnvironmentValues {
    var otpFieldStyle: any OTPFieldStyle {
        get { self[OTPFieldStyleKey.self] }
        set { self[OTPFieldStyleKey.self] = newValue }
    }
}
