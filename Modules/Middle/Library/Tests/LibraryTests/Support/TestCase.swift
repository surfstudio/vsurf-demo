//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest

/// Абстракция для ожиданий кейсы
struct TestCase<T, E> {
    let given: T
    let expected: E
}

/// Абстракция для результата кейса
struct TestCaseResult<T: Equatable> {
    let result: T
    let expected: T
}
