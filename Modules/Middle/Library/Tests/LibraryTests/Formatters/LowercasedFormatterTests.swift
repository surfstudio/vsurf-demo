//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import XCTest
@testable import Library

final class LowercasedFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: " "),
            .init(given: "1234", expected: "1234"),
            .init(given: "abc", expected: "abc"),
            .init(given: "ABC", expected: "abc"),
            .init(given: "Long string with text", expected: "long string with text"),
            .init(given: "First sentence. Second sentence.", expected: "first sentence. second sentence.")
        ]
        let formatter = LowercasedTextFormatter()

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
