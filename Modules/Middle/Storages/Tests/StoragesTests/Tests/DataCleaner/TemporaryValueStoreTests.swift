//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import XCTest
@testable import Storages

/// Тесты на проверку работы type erasure ValueStore
final class TemporaryValueStoreTests: XCTestCase {

    // MARK: - Tests

    func testErase_whenNotEmpty_thenValueIsNil() throws {
        // given
        let store: TemporaryValueStore<String> = TemporaryValueStore(value: "TestValue")

        // when
        store.erase()

        // then
        XCTAssertNil(store.load())
    }

    func testLoad_whenUsingOtherInstance_thenValueIsNil() throws {
        // given
        let store1: TemporaryValueStore<String> = TemporaryValueStore(value: nil)
        let store2: TemporaryValueStore<String> = TemporaryValueStore(value: nil)

        // when
        store1.save(value: "TestValue")

        // then
        XCTAssertEqual("TestValue", store1.load())
        XCTAssertNil(store2.load())
    }

    func testLoad_whenUsingSameInstance_thenValueIsNotNil() throws {
        // given
        let store: TemporaryValueStore<String> = TemporaryValueStore(value: nil)

        // when
        store.save(value: "TestValue")

        // then
        XCTAssertEqual("TestValue", store.load())
    }

    func testAppendString_whenEmpty_thenSaved() throws {
        // given
        let store: TemporaryValueStore<String> = TemporaryValueStore(value: nil)

        // when
        store.append("TestValue")

        // then
        XCTAssertEqual(store.load(), "TestValue")
    }

    func testAppendString_whenNotEmpty_thenSavedWithSuffix() throws {
        // given
        let store: TemporaryValueStore<String> = TemporaryValueStore(value: "TestValue")

        // when
        store.append("Suffix")

        // then
        XCTAssertEqual(store.load(), "TestValueSuffix")
    }

    func testPlus_whenNil_thenInitialised() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: nil)

        // when
        store += 10

        // then
        XCTAssertEqual(store.load(), 10)
    }

    func testPlus_whenNotNil_thenAppended() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: 5)

        // when
        store += 10

        // then
        XCTAssertEqual(store.load(), 15)
    }

    func testMinus_whenNil_thenInitialised() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: nil)

        // when
        store -= 10

        // then
        XCTAssertEqual(store.load(), -10)
    }

    func testMinus_whenNotNil_thenAppended() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: 5)

        // when
        store -= 10

        // then
        XCTAssertEqual(store.load(), -5)
    }

    func testMultiplier_whenNil_thenKeepNil() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: nil)

        // when
        store *= 10

        // then
        XCTAssertEqual(store.load(), 0)
    }

    func testMultiplier_whenNotNil_thenAppended() throws {
        // given
        let store: TemporaryValueStore<Int> = TemporaryValueStore(value: 5)

        // when
        store *= 10

        // then
        XCTAssertEqual(store.load(), 50)
    }

}
