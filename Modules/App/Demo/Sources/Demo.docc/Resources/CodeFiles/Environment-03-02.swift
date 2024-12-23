import SwiftUI

@main
struct TutorApp: App {

    private let onboardingStatusStorage: OnboardingStatusStorage

    init() {
        self.onboardingStatusStorage = OnboardingStatusStorageFactory.produce()
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if onboardingStatusStorage.isOnboardingCompleted {
                    MainView()
                } else {
                    OnboardingView()
                }
            }
            .environmentObject(onboardingStatusStorage)
        }
    }
}
