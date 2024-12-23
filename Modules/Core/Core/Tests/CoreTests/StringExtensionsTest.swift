//
//  Copyright © Surf. All rights reserved.
//

import XCTest
@testable import Core

final class StringExtensionsTest: XCTestCase {

    func testDigits_whenHasDigits_thenReturnAllDigits() {
        // given
        let string = "123abc456"
        let expected = "123456"

        // when
        let result = string.digits

        // then
        XCTAssertEqual(result, expected)
    }

    func testDigits_whenNoDigits_thenReturnEmptyString() {
        // given
        let string = "abc"
        let expected = ""

        // when
        let result = string.digits

        // then
        XCTAssertEqual(result, expected)
    }

    func testNormalized_whenNotEmpty_thenReturnString() {
        // given
        let string = "123abc456"
        let expected = "123abc456"

        // when
        let result = string.normalized()

        // then
        XCTAssertEqual(result, expected)
    }

    func testNormalized_whenEmpty_thenReturnNil() {
        // given
        let string = ""

        // when
        let result = string.normalized()

        // then
        XCTAssertNil(result)
    }

}
