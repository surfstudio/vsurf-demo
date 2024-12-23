import SwiftUI
import SurfCore

enum AppRootPoint {
    case tutor
    case main
}

final class AppLauchInstructor: TutorSignal {
    @Published var rootPoint: AppRootPoint = .tutor

    // MARK: - TutorSignal

    func onTutorCancelled() {
        rootPoint = .main
    }

    func onTutorCompleted() {
        rootPoint = .main
    }
}
