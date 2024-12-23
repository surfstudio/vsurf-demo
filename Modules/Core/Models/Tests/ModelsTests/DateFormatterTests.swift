//
//  Copyright © Surf. All rights reserved.
//

import XCTest
@testable import Models

final class DateFormatterTests: XCTestCase {

    // MARK: - References

    let referencedDate = Date(timeIntervalSince1970: 1_614_950_400)

    // MARK: - Tests

    func testDefaultServerDate() throws {
        let formatter = DateFormatter.defaultServerDate
        let formattedDate = formatter.string(from: referencedDate)
        XCTAssertEqual(formattedDate, "2021-03-05")
    }

    func testDefaultServerDateTime() throws {
        let formatter = DateFormatter.defaultServerDateTime
        formatter.timeZone = .init(secondsFromGMT: 4 * 60 * 60)
        let formattedDate = formatter.string(from: referencedDate)
        XCTAssertEqual(formattedDate, "2021-03-05T17:20:00+0400")
    }

    func testDateFromOptionalString_whenStringIsNil_thenReturnNil() throws {
        let formatter = DateFormatter.defaultServerDateTime
        let formattedDate = formatter.date(from: nil)
        XCTAssertNil(formattedDate)
    }

    func testDateFromOptionalString_whenStringIsNotNil_thenReturnDate() throws {
        let formatter = DateFormatter.defaultServerDateTime
        formatter.timeZone = .init(secondsFromGMT: 4 * 60 * 60)
        let formattedDate = formatter.date(from: "2021-03-05T17:20:00+0400")
        XCTAssertEqual(formattedDate, referencedDate)
    }

    func testStringFromOptionalDate_whenDateIsNil_thenReturnsNil() throws {
        let formatter = DateFormatter.defaultServerDateTime
        let formattedDate = formatter.string(fromOptionalDate: nil)
        XCTAssertNil(formattedDate)
    }

    func testStringFromOptionalDate_whenDateIsNotNil_thenReturnsString() throws {
        let formatter = DateFormatter.defaultServerDateTime
        formatter.timeZone = .init(secondsFromGMT: 4 * 60 * 60)
        let formattedDate = formatter.string(fromOptionalDate: referencedDate)
        XCTAssertEqual(formattedDate, "2021-03-05T17:20:00+0400")
    }
}
