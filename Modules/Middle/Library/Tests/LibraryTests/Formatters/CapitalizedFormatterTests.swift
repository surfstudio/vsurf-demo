//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import XCTest
@testable import Library

final class CapitalizedFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: ""),
            .init(given: " ", expected: " "),
            .init(given: "1234", expected: "1234"),
            .init(given: "abc", expected: "Abc"),
            .init(given: "ABC", expected: "Abc"),
            .init(given: "Long string with text", expected: "Long String With Text"),
            .init(given: "First sentence. Second sentence.", expected: "First Sentence. Second Sentence.")
        ]
        let formatter = CapitalizedTextFormatter()

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
