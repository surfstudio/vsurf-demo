//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Library

final class MaxLengthValidatorTests: XCTestCase {

    // MARK: - Tests

    func testValidator_whenLess_thenIsValid() {

        // given
        let text = ""
        let validator = MaxLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNil(validationState.errorText)
    }

    func testValidator_whenEqual_thenIsValid() {

        // given
        let text = "1"
        let validator = MaxLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNil(validationState.errorText)
    }

    func testValidator_whenGreater_thenIsInvalid() {

        // given
        let text = "12"
        let validator = MaxLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNotNil(validationState.errorText)
    }

}
