import Foundation

@objc
public protocol TutorSignal: AnyObject {
    func onTutorCancelled()
    func onTutorCompleted()
}
