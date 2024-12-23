//
//  Copyright © Surf. All rights reserved.
//

import XCTest
@testable import Core

final class ArrayExtensionsTest: XCTestCase {

    func testSafeByIndex_whenHasItem_thenReturnIt() {
        // given
        let array = [1, 2, 3]
        let expected = 2

        // when
        let result = array[safe: 1]

        // then
        XCTAssertEqual(result, expected)
    }

    func testSafeByIndex_whenNoItem_thenReturnNil() {
        // given
        let array = [1, 2, 3]

        // when
        let result = array[safe: 3]

        // then
        XCTAssertNil(result)
    }

}
