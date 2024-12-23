import SwiftUI
import SurfCore

struct OnboardingView: View {

    @WeakReference private var onboardingSignal: OnboardingFlowSignal?

    var body: some View {
        VStack {
            Text("Последний экран онбоардинга")

            Button {
                onboardingSignal?.onboardingCompleted()
            } label: {
                Text("Готово")
            }
        }
    }
}
