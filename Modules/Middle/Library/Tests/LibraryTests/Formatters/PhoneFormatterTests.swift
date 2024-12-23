//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import XCTest
@testable import Library

final class PhoneFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter_whenAppliedMultiple_likeUsingKeyboardInput() {

        // given
        let initial = ""
        let formatter = PhoneMaskTextFormatter(mask: "+7 (###) ###-##-##")
        var results = [String]()

        // when
        results.append(formatter.format(text: initial))
        results.append(formatter.format(text: results.last! + "1"))
        results.append(formatter.format(text: results.last! + "2"))
        results.append(formatter.format(text: results.last! + "3"))
        results.append(formatter.format(text: results.last! + "4"))
        results.append(formatter.format(text: results.last! + "5"))
        results.append(formatter.format(text: results.last! + "6"))
        results.append(formatter.format(text: results.last! + "7"))
        results.append(formatter.format(text: results.last! + "8"))
        results.append(formatter.format(text: results.last! + "9"))
        results.append(formatter.format(text: results.last! + "0"))
        results.append(formatter.format(text: results.last! + "1"))

        // then
        XCTAssertEqual(results[0], "+7 (")
        XCTAssertEqual(results[1], "+7 (1")
        XCTAssertEqual(results[2], "+7 (12")
        XCTAssertEqual(results[3], "+7 (123) ")
        XCTAssertEqual(results[4], "+7 (123) 4")
        XCTAssertEqual(results[5], "+7 (123) 45")
        XCTAssertEqual(results[6], "+7 (123) 456-")
        XCTAssertEqual(results[7], "+7 (123) 456-7")
        XCTAssertEqual(results[8], "+7 (123) 456-78-")
        XCTAssertEqual(results[9], "+7 (123) 456-78-9")
        XCTAssertEqual(results[10], "+7 (123) 456-78-90")
        XCTAssertEqual(results[11], "+7 (123) 456-78-90")
    }

    func testFormatter_whenAppliedMultiple_likeUsingKeyboardDeletion() {

        // given
        let initial = "+7 (123) 456-78-90"
        let formatter = PhoneMaskTextFormatter(mask: "+7 (###) ###-##-##")
        var results = [String]()

        // when
        results.append(formatter.format(text: initial))
        for _ in 0...10 {
            results.append(formatter.format(text: String(results.last!.dropLast(1))))
        }

        // then
        XCTAssertEqual(results[0], "+7 (123) 456-78-90")
        XCTAssertEqual(results[1], "+7 (123) 456-78-9")
        XCTAssertEqual(results[2], "+7 (123) 456-78-")
        XCTAssertEqual(results[3], "+7 (123) 456-7")
        XCTAssertEqual(results[4], "+7 (123) 456-")
        XCTAssertEqual(results[5], "+7 (123) 45")
        XCTAssertEqual(results[6], "+7 (123) 4")
        XCTAssertEqual(results[7], "+7 (123) ")
        XCTAssertEqual(results[8], "+7 (12")
        XCTAssertEqual(results[9], "+7 (1")
        XCTAssertEqual(results[10], "+7 (")
        XCTAssertEqual(results[11], "+7 (")
    }

    func testFormatter_withPrettyRussionNumberMask() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: "+7 ("),
            .init(given: "7", expected: "+7 (7"),
            .init(given: "1", expected: "+7 (1"),
            .init(given: "12", expected: "+7 (12"),
            .init(given: "123", expected: "+7 (123) "),
            .init(given: "1234", expected: "+7 (123) 4"),
            .init(given: "12345", expected: "+7 (123) 45"),
            .init(given: "123456", expected: "+7 (123) 456-"),
            .init(given: "1234567", expected: "+7 (123) 456-7"),
            .init(given: "12345678", expected: "+7 (123) 456-78-"),
            .init(given: "123456789", expected: "+7 (123) 456-78-9"),
            .init(given: "71234567890", expected: "+7 (123) 456-78-90"),
            .init(given: "+71234567890", expected: "+7 (123) 456-78-90"),
            .init(given: "+7 (123) 456-78-90", expected: "+7 (123) 456-78-90")
        ]
        let formatter = PhoneMaskTextFormatter(mask: "+7 (###) ###-##-##")

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

    func testFormatter_withUglyRussionNumberMask() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: "8"),
            .init(given: "7", expected: "87"),
            .init(given: "12", expected: "812"),
            .init(given: "123", expected: "8123"),
            .init(given: "1234", expected: "81234"),
            .init(given: "12345", expected: "812345"),
            .init(given: "123456", expected: "8123456"),
            .init(given: "1234567", expected: "81234567"),
            .init(given: "12345678", expected: "812345678"),
            .init(given: "123456789", expected: "8123456789"),
            .init(given: "+71234567890", expected: "81234567890"),
            .init(given: "81234567890", expected: "81234567890")
        ]
        let formatter = PhoneMaskTextFormatter(mask: "8##########")

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

    func testFormatter_withUglyEmiratesNumberMask() {

        // given
        let testCases: [TestCase] = [
            .init(given: "", expected: "+971-"),
            .init(given: "7", expected: "+971-7"),
            .init(given: "1", expected: "+971-1"),
            .init(given: "12", expected: "+971-12-"),
            .init(given: "123", expected: "+971-12-3"),
            .init(given: "1234", expected: "+971-12-34"),
            .init(given: "12345", expected: "+971-12-345"),
            .init(given: "123456", expected: "+971-12-3456"),
            .init(given: "1234567", expected: "+971-12-34567"),
            .init(given: "12345678", expected: "+971-12-345678"),
            .init(given: "123456789", expected: "+971-12-3456789"),
            .init(given: "7123456789", expected: "+971-12-3456789"),
            .init(given: "+7123456789", expected: "+971-12-3456789"),
            .init(given: "+971-12-3456789", expected: "+971-12-3456789")
        ]
        let formatter = PhoneMaskTextFormatter(mask: "+971-##-#######")

        // when
        let results: [TestCaseResult] = testCases.map {
            .init(result: formatter.format(text: $0.given), expected: $0.expected)
        }

        // then
        results.forEach { XCTAssertEqual($0.result, $0.expected) }
    }

}
