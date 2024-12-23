import SwiftUI
import SurfMacros

@NavigationState
struct TutorNavigationState {

    enum Destination: Hashable {
        case itemDetail(SomeEntity)
        case stub(String)
        case final
    }

    var navigationPath: NavigationPath

    static var initial: Self {
        .init(navigationPath: .init())
    }

    mutating func push(destination: Destination) {
        navigationPath.append(destination)
    }

    mutating func pop() {
        navigationPath.removeLast()
    }

    mutating func popToRoot() {
        navigationPath = .init()
    }
}
