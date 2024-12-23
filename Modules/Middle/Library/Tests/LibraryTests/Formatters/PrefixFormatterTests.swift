//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Library

final class PrefixFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter() {
        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: " "),
            .init(given: "1234", expected: "12"),
            .init(given: "abc", expected: "ab"),
            .init(given: "ABC", expected: "AB"),
            .init(given: "Long string with text", expected: "Lo"),
            .init(given: "First sentence. Second sentence.", expected: "Fi")
        ]
        let formatter = PrefixTextFormatter(maxLength: 2)

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }
}
