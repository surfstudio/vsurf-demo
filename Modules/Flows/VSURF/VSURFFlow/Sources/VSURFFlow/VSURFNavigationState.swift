import SwiftUI
import SurfMacros
// swiftlint:disable convenience_type

@NavigationState
struct VSURFNavigationState {

    enum Destination: Hashable, CaseIterable {
        case cart
    }

}
