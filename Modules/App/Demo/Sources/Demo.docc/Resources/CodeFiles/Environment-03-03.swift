@objc
public protocol OnboardingFlowSignal {
    func onboardingCompleted()
}

public protocol OnboardingCompletionProvider: AnyObject {

    var isOnboardingCompleted: Bool { get }

}
