import SwiftUI
import SurfCore

enum AppRootPoint {
    case tutor
    case main
}

final class AppLauchInstructor {
    @Published var rootPoint: AppRootPoint = .tutor
}
