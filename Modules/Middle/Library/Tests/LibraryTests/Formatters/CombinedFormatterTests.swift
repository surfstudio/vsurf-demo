//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import MockableTest
import XCTest
@testable import Library

final class CombinedFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatter_whenEmpty_thenNoChanges() {

        // given
        let text = "Some string ABCD "
        let formatter = CombinedTextFormatter(formatters: [])

        // when
        let formattedText = formatter.format(text: text)

        // then
        XCTAssertEqual(text, formattedText)
    }

    func testFormatter_whenTwoFormatters_thenExecutedInCorrectOrder() {

        // given
        let text = "Some string ABCD "
        let firstExpectation = "Some string ABCD"
        let secondExpectation = "some string abcd"
        let firstFormatter = MockTextFormatter()
        let secondFormatter = MockTextFormatter()
        let formatter = [firstFormatter, secondFormatter].combined

        given(firstFormatter).format(text: .any).willReturn(firstExpectation)
        given(secondFormatter).format(text: .any).willReturn(secondExpectation)

        // when
        let formattedText = formatter.format(text: text)

        // then
        verify(firstFormatter)
            .format(text: .matching { text == $0 })
            .called(count: .once)
        verify(secondFormatter)
            .format(text: .matching { firstExpectation == $0 })
            .called(count: .once)
        XCTAssertEqual(secondExpectation, formattedText)
    }

}
