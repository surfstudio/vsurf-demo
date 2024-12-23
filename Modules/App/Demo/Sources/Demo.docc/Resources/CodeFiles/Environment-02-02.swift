import SwiftUI

public protocol TabBarViewStyle {

    associatedtype ContainerView: View
    associatedtype ItemView: View

    @ViewBuilder
    func makeItem(_ item: TabItemView, isActive: Bool) -> ItemView

    @ViewBuilder
    func makeContainer(_ container: AnyView) -> ContainerView

}

public enum TabBarViewStyleKey: EnvironmentKey {
    public static var defaultValue: any TabBarViewStyle = .classic
}

public extension EnvironmentValues {
    var tabBarViewStyle: any TabBarViewStyle {
        get { self[TabBarViewStyleKey.self] }
        set { self[TabBarViewStyleKey.self] = newValue }
    }
}
