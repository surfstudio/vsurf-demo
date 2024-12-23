//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Library

final class DigitsFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: ""),
            .init(given: "1234", expected: "1234"),
            .init(given: "a1bc", expected: "1"),
            .init(given: "A112BC3", expected: "1123"),
            .init(given: "Long string with text", expected: ""),
            .init(given: "First sentence. Second sentence.", expected: "")
        ]
        let formatter = DigitsTextFormatter()

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
