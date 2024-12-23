import SwiftUI

struct OnboardingView: View {

    @EnvironmentObject private var onboardingStatusStorage: OnboardingStatusStorage

    var body: some View {
        VStack {
            Text("Последний экран онбоардинга")

            Button {
                onboardingStatusStorage.isOnboardingCompleted = true
            } label: {
                Text("Готово")
            }
        }
    }
}
