//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import MockableTest
import XCTest
@testable import Library

final class CombinedValidatorTests: XCTestCase {

    // MARK: - Tests

    func testValidator_whenEmpty_thenIsValid() {

        // given
        let text = "Some string"
        let validator = CombinedTextValidator([])

        // when
        let validationState = validator.validate(text: text)

        // then
        XCTAssertEqual(validationState, .valid)
    }

    func testValidator_whenBothValid_thenExecutedInCorrectOrder() {

        // given
        let text = "Some string"
        let expectation = TextValidationResult.valid
        let firstMock = MockTextValidator()
        let secondMock = MockTextValidator()
        let validator = [firstMock, secondMock].combined

        given(firstMock).validate(text: .any).willReturn(expectation)
        given(secondMock).validate(text: .any).willReturn(expectation)

        // when
        let validationState = validator.validate(text: text)

        // then
        verify(firstMock)
            .validate(text: .matching { text == $0 })
            .called(count: .once)
        verify(secondMock)
            .validate(text: .matching { text == $0 })
            .called(count: .once)
        XCTAssertEqual(expectation, validationState)
    }

    func testValidator_whenFirstValidatorFailed_thenSecondIsNotCalled() {

        // given
        let text = "Some string"
        let expectation = TextValidationResult.invalid(errorText: "Error")
        let firstMock = MockTextValidator()
        let secondMock = MockTextValidator()
        let validator = [firstMock, secondMock].combined

        given(firstMock).validate(text: .any).willReturn(expectation)

        // when
        let validationState = validator.validate(text: text)

        // then
        verify(firstMock)
            .validate(text: .matching { text == $0 })
            .called(count: .once)
        verify(secondMock)
            .validate(text: .matching { text == $0 })
            .called(count: .never)
        XCTAssertEqual(expectation, validationState)
    }

    func testValidator_whenSecondValidatorFailed_thenFirstCalledBefore() {

        // given
        let text = "Some string"
        let expectation = TextValidationResult.invalid(errorText: "Error")
        let firstMock = MockTextValidator()
        let secondMock = MockTextValidator()
        let validator = [firstMock, secondMock].combined

        given(firstMock).validate(text: .any).willReturn(.valid)
        given(secondMock).validate(text: .any).willReturn(expectation)

        // when
        let validationState = validator.validate(text: text)

        // then
        verify(firstMock)
            .validate(text: .matching { text == $0 })
            .called(count: .once)
        verify(secondMock)
            .validate(text: .matching { text == $0 })
            .called(count: .once)
        XCTAssertEqual(expectation, validationState)
    }

}
