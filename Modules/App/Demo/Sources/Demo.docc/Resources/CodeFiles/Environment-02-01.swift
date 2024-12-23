import SwiftUI

public protocol TabBarViewStyle {

    associatedtype ContainerView: View
    associatedtype ItemView: View

    @ViewBuilder
    func makeItem(_ item: TabItemView, isActive: Bool) -> ItemView

    @ViewBuilder
    func makeContainer(_ container: AnyView) -> ContainerView

}
