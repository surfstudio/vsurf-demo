import Foundation
import SurfCore
import SurfMacros

@Multicast
@objc
public protocol TutorSignal: AnyObject {
    func onTutorCancelled()
    func onTutorCompleted()
}
