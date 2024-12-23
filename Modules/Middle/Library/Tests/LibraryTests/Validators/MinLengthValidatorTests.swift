//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Library

final class MinLengthValidatorTests: XCTestCase {

    // MARK: - Tests

    func testValidator_whenLess_thenIsInvalid() {

        // given
        let text = ""
        let validator = MinLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNotNil(validationState.errorText)
    }

    func testValidator_whenEqual_thenIsInvalid() {

        // given
        let text = "1"
        let validator = MinLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNotNil(validationState.errorText)
    }

    func testValidator_whenGreater_thenIsValid() {

        // given
        let text = "12"
        let validator = MinLengthTextValidator(length: 1)

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNil(validationState.errorText)
    }

}
