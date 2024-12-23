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

public extension View {
    func placeholderValue(_ placeholderValue: String) -> some View {
        self.environment(\.placeholderValue, placeholderValue)
    }
}
