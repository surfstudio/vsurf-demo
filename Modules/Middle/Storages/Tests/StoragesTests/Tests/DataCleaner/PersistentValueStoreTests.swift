//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable force_unwrapping

import Foundation
import MockableTest
import XCTest
@testable import Storages

/// Тесты на проверку работы PersistentValueStore с различными хранилищами
final class PersistentValueStoreTests: XCTestCase {

    private enum Constants {
        static let userDefaultsParams: DataStoreFactory.Params = .userDefaults(suiteName: "Test", key: "test")
        static let keychainParams: DataStoreFactory.Params = .keychain(service: "dev.surf", key: "test")
        static let filePath: URL = FileManager.default.temporaryDirectory.appendingPathComponent("test")
    }

    private var dataStore: (any DataStore)?
    private var dataConverter: (any DataConverter)?

    // MARK: - Setup

    override func tearDown() {
        super.tearDown()
        try? dataStore?.erase()
    }

    // MARK: - Unit Tests

    // юнит-тестами покрываем негативные сценарии

    func testSave_thenConverter_andStoreCalled() throws {
        // given
        let testString = "TestValue"
        let testData = testString.data(using: .utf8)!

        let dataStore = MockDataStore(policy: .relaxedVoid)
        let dataConverter = MockDataConverter()
        let store: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        given(dataConverter).encode(.value([testString])).willReturn(testData)

        // when
        store.save(value: testString)

        // then
        verify(dataConverter).encode(.value([testString])).called(count: 1)
        verify(dataStore).save(data: .value(testData)).called(count: 1)
    }

    func testErase_thenStoreCalled() throws {
        // given
        let dataStore = MockDataStore(policy: .relaxedVoid)
        let dataConverter = MockDataConverter()
        let store: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        // when
        store.erase()

        // then
        verify(dataStore).erase().called(count: 1)
    }

    func testLoad_whenNoData_thenReturnNil() throws {
        // given
        let dataStore = MockDataStore()
        let dataConverter = MockDataConverter()
        let store: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        given(dataStore).load().willReturn(nil)

        // when
        let loadedValue = store.load()

        // then
        verify(dataConverter).decode(.value(String.self), from: .any).called(count: 0)
        verify(dataStore).load().called(count: 1)
        XCTAssertNil(loadedValue)
    }

    func testLoad_whenDataStoreThrowError_thenReturnNil() throws {
        // given
        let dataStore = MockDataStore()
        let dataConverter = MockDataConverter()
        let store: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        given(dataStore).load().willThrow(TestError.stub)

        // when
        let loadedValue = store.load()

        // then
        verify(dataConverter).decode(.value(String.self), from: .any).called(count: 0)
        verify(dataStore).load().called(count: 1)
        XCTAssertNil(loadedValue)
    }

    func testLoad_whenDataConverterThrowError_thenReturnNil() throws {
        // given
        let testData = Data()
        Matcher.register([String].Type.self)

        let dataStore = MockDataStore(policy: .relaxedVoid)
        let dataConverter = MockDataConverter()
        let store: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        given(dataConverter).decode(.value([String].self), from: .value(testData)).willThrow(TestError.stub)
        given(dataStore).load().willReturn(testData)

        // when
        let loadedValue = store.load()

        // then
        verify(dataStore)
            .load().called(count: 1)
            .erase().called(count: 1)
        verify(dataConverter).decode(.value([String].self), from: .value(testData)).called(count: 1)
        XCTAssertNil(loadedValue)
    }

    // MARK: - UserDefaults integration Tests

    func testSaveLoad_fromUserDefaults_withJSON() throws {
        // prepare
        dataStore = DataStoreFactory.provide(with: Constants.userDefaultsParams)
        dataConverter = DataConverterFactory.provide(with: .json)

        // assert
        assertValuesInTwoStoresAreEqual()
    }

    func testSaveLoad_fromUserDefaults_withPlist() throws {
        // prepare
        dataStore = DataStoreFactory.provide(with: Constants.userDefaultsParams)
        dataConverter = DataConverterFactory.provide(with: .plist)

        // assert
        assertValuesInTwoStoresAreEqual()
    }

    // MARK: - FileManager integration Tests

    func testSaveLoad_fromFiles_withJSON() throws {
        // prepare
        dataStore = DataStoreFactory.provide(with: .file(urlPath: Constants.filePath.appendingPathExtension("json")))
        dataConverter = DataConverterFactory.provide(with: .json)

        // assert
        assertValuesInTwoStoresAreEqual()
    }

    func testSaveLoad_fromFiles_withPlist() throws {
        // prepare
        dataStore = DataStoreFactory.provide(with: .file(urlPath: Constants.filePath.appendingPathExtension("plist")))
        dataConverter = DataConverterFactory.provide(with: .plist)

        // assert
        assertValuesInTwoStoresAreEqual()
    }

    // MARK: - Keychain integration Tests

// тесты на keychain нельзя сделать на уровне пакета. надо вынести их на уровень app или настроить host application
// подробнее: - https://forums.swift.org/t/how-can-test-targets-be-run-with-entitlement/47482
//    func testSaveLoad_fromKeychain_withJSON() throws {
//        // prepare
//        dataStore = DataStoreFactory.provide(with: Constants.keychainParams)
//        dataConverter = DataConverterFactory.provide(with: .json)
//
//        // assert
//        assertValuesInTwoStoresAreEqual()
//    }
//
//    func testSaveLoad_fromKeychain_withPlist() throws {
//        // prepare
//        dataStore = DataStoreFactory.provide(with: Constants.keychainParams)
//        dataConverter = DataConverterFactory.provide(with: .plist)
//
//        // assert
//        assertValuesInTwoStoresAreEqual()
//    }

}

// MARK: - Asserts

private extension PersistentValueStoreTests {

    func assertValuesInTwoStoresAreEqual() {
        // unwrap
        guard let dataStore, let dataConverter else {
            XCTFail("Be sure to setup dataStore and dataConverter for integration tests.")
            return
        }

        // given
        let store1: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)
        let store2: PersistentValueStore<String> = PersistentValueStore(store: dataStore, dataConverter: dataConverter)

        // when
        store1.save(value: "TestValue")

        // then
        XCTAssertEqual("TestValue", store1.load())
        XCTAssertEqual("TestValue", store2.load())
    }

}
