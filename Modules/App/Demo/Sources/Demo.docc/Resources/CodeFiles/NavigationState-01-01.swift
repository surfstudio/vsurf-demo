import SwiftUI
import SurfMacros

// swiftlint:disable convenience_type
@NavigationState
struct TutorNavigationState {

    enum Destination: Hashable {
        case itemDetail(SomeEntity)
        case stub(String)
        case final
    }
}
// swiftlint:enable convenience_type
