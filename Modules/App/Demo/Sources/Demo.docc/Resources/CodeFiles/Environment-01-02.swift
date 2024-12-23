import Foundation
import SwiftUI

public enum PlaceholderValueKey: EnvironmentKey {
    public static var defaultValue: String = ""
}

public extension EnvironmentValues {
    var placeholderValue: String {
        get { self[PlaceholderValueKey.self] }
        set { self[PlaceholderValueKey.self] = newValue }
    }
}
