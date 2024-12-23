//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import MockableTest
import XCTest
@testable import Storages

/// Тесты на проверку работы сервиса очистки данных DataCleaner
final class DataCleanerTests: XCTestCase {

    // MARK: - Tests

    /// - добавляем в сервис хранилище, но не указываем событие,
    /// на которое оно должно очиститься
    /// - вызываем метод очистки со всеми возможными параметрами
    /// - проверяем что метод очистки хранилища не вызывался
    func testEmptyEventsClean() throws {
        // given
        let service = DataCleanerService()
        let storage = MockDataCleanerCompatible()

        // when
        service.add(storage: storage, for: [])
        service.clean(event: "login")
        service.clean(event: "logout")

        // then
        verify(storage).clean().called(count: 0)
    }

    /// - добавляем в сервис хранилище, указываем один event,
    /// на которое оно должно очиститься
    /// - вызываем метод очистки, передаем указанный в первом пункте event
    /// - проверяем что метод очистки хранилища вызывался
    func testSuitableSingleEventClean() throws {
        // given
        let service = DataCleanerService()
        let storage = MockDataCleanerCompatible(policy: .relaxedVoid)

        // when
        service.add(storage: storage, for: ["login"])
        service.clean(event: "login")

        // then
        verify(storage).clean().called(count: 1)
    }

    /// - добавляем в сервис хранилище, указываем один event,
    /// на которое оно должно очиститься
    /// - вызываем метод очистки, передаем отличный от указанного в первом пункте event
    /// - проверяем что метод очистки хранилища не вызывался
    func testUnsuitableSingleEventClean() throws {
        // given
        let service = DataCleanerService()
        let storage = MockDataCleanerCompatible()

        // when
        service.add(storage: storage, for: ["login"])
        service.clean(event: "logout")

        // then
        verify(storage).clean().called(count: 0)
    }

    /// - добавляем в сервис хранилище, указываем все возможные event-ы,
    /// на которое оно должно очиститься
    /// - вызываем метод очистки со всеми возможными параметрами
    /// - проверяем что метод очистки хранилища вызывался столько раз,
    /// сколько существует event-ов
    func testMultiEventsClean() throws {
        // given
        let service = DataCleanerService()
        let storage = MockDataCleanerCompatible(policy: .relaxedVoid)

        // when
        service.add(storage: storage, for: ["login", "logout"])
        service.clean(event: "login")
        service.clean(event: "logout")

        // then
        verify(storage).clean().called(count: 2)
    }

    /// - добавляем в сервис хранилища с разными комбинациями event-ов для очистки
    /// - вызываем метод очистки со всеми возможными параметрами
    /// - проверяем что методы очистки хранилищ вызывались столько раз,
    /// сколько необходимо по смыслу
    func testMultiStoragesClean() throws {
        // given
        let service = DataCleanerService()
        let storage1 = MockDataCleanerCompatible(policy: .relaxedVoid) // DataCleanerCompatibleStorageMock()
        let storage2 = MockDataCleanerCompatible(policy: .relaxedVoid) // DataCleanerCompatibleStorageMock()
        let storage3 = MockDataCleanerCompatible(policy: .relaxedVoid) // DataCleanerCompatibleStorageMock()
        let storage4 = MockDataCleanerCompatible(policy: .relaxedVoid) // DataCleanerCompatibleStorageMock()

        // when
        service.add(storage: storage1, for: [])
        service.add(storage: storage2, for: ["login"])
        service.add(storage: storage3, for: ["logout"])
        service.add(storage: storage4, for: ["login", "logout"])
        service.clean(event: "login")
        service.clean(event: "logout")

        // then
        verify(storage1).clean().called(count: 0)
        verify(storage2).clean().called(count: 1)
        verify(storage3).clean().called(count: 1)
        verify(storage4).clean().called(count: 2)
    }

}
