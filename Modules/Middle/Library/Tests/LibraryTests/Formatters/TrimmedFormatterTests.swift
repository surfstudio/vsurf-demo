//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import XCTest
@testable import Library

final class TrimmedFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter_trimmingWhitespaces() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: ""),
            .init(given: "1234", expected: "1234"),
            .init(given: "abc", expected: "abc"),
            .init(given: "ABC", expected: "ABC"),
            .init(given: " Long string with text", expected: "Long string with text"),
            .init(given: " Some text surrounded with spaces ", expected: "Some text surrounded with spaces"),
            .init(given: "First sentence. Second sentence. ", expected: "First sentence. Second sentence.")
        ]
        let formatter = TrimmingTextFormatter(characters: .whitespaces)

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

    func testFormatter_trimmingDigits() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: " "),
            .init(given: "1234", expected: ""),
            .init(given: "0a1b2c3", expected: "a1b2c"),
            .init(given: "abc", expected: "abc")
        ]
        let formatter = TrimmingTextFormatter(characters: .decimalDigits)

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
