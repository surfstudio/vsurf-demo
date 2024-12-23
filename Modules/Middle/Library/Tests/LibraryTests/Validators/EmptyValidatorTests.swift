//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Library

final class EmptyValidatorTests: XCTestCase {

    // MARK: - Tests

    func testValidator_whenEmpty_thenIsInvalid() {

        // given
        let text = ""
        let validator = NonEmptyTextValidator()

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNotNil(validationState.errorText)
    }

    func testValidator_whenNotEmpty_thenIsValid() {

        // given
        let text = "Some string"
        let validator = NonEmptyTextValidator()

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertNil(validationState.errorText)
    }

}
