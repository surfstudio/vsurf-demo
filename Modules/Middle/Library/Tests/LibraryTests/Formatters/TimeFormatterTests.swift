//
//  Copyright © Surf. All rights reserved.
//

import XCTest
@testable import Library

final class TimeFormatterTests: XCTestCase {

    func testTimeFormatter() {
        // given
        let testCases: [TestCase] = [
            .init(given: 2, expected: "2 секунды"),
            .init(given: 10, expected: "10 секунд"),
            .init(given: 60, expected: "1 минуту 0 секунд"),
            .init(given: 61, expected: "1 минуту 1 секунду"),
            .init(given: 3599, expected: "59 минут 59 секунд"),
            // переполнение
            // отображение часа не предусмотрено в текущем форматтере
            .init(given: 3605, expected: "5 секунд")
        ]

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: TimeFormatter().format($0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
