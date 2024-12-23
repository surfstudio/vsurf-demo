import SwiftUI
import SurfCore

@main
struct TutorApp: App {

    private let lauchInstructor: AppLauchInstructor

    init() {
        self.lauchInstructor = AppLauchInstructor()
    }

    var body: some Scene {
        WindowGroup {
            Group {
                switch launchInstructor.rootPoint {
                case .tutor:
                    TutorView()
                case .main:
                    MainView()
                }
            }.weakReference(TutorSignals {
                lauchInstructor
            }, as: TutorSignal.self)
        }
    }
}
