//
//  Copyright © Surf. All rights reserved.
//

import Combine
import SurfCore
import XCTest

public extension XCTestCase {

    /// Вспомогательная функция для ожидания результата от Publisher.
    /// - Parameters:
    ///  - publisher: Поток событий.
    ///  - timeout: Время ожидания в секундах.
    ///  - action: Действие, которое нужно выполнить после подписки.
    ///  - file: Исходник в котором инициализировано ожидание (заполняется автоматически).
    ///  - line: Строка вызова ожидания (заполняется автоматически).
    /// - Returns: Все пойманные результаты.
    func expectPublisher<T: Publisher>(_ publisher: T,
                                       timeout: TimeInterval = 1,
                                       action: EmptyClosure? = nil,
                                       file: StaticString = #file,
                                       line: UInt = #line) throws -> T.Output {
        let result = expect(publisher,
                            timeout: timeout,
                            action: action)

        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )

        return try unwrappedResult.get()
    }

    /// Вспомогательная функция сбора событий Publisher.
    /// - Parameters:
    ///  - publisher: Поток событий.
    ///  - arrayWrapper: Обертка над массивом для сохранения событий.
    /// - Returns: Подписка на Publisher.

    func collectValues<P: Publisher>(of publisher: P,
                                     in arrayWrapper: ArrayWrapper<P.Output>) -> Cancellable where P.Failure == Never {
        return publisher.sink { arrayWrapper.append($0) }
	}

    /// Вспомогательная функция для ожидания отсутствия результата от Publisher.
    /// - Warning: Чтобы `publisher` в любом случае закрыл expectation, используется оператор `timeout`.
    /// - Parameters:
    ///  - publisher: Поток событий.
    ///  - timeout: Время ожидания в секундах.
    ///  - action: Действие, которое нужно выполнить после подписки.
    ///  - file: Исходник в котором инициализировано ожидание (заполняется автоматически).
    ///  - line: Строка вызова ожидания (заполняется автоматически).
    /// - Returns: `true` если не было получено ивентов. `false` иначе.
    func expectPublisherIsEmpty(_ publisher: some Publisher,
                                timeout: TimeInterval = 1,
                                action: EmptyClosure? = nil,
                                file: StaticString = #file,
                                line: UInt = #line) -> Bool {
        let result = expect(publisher.timeout(.seconds(timeout),
                                              scheduler: DispatchQueue.main),
                            timeout: timeout,
                            action: action)

        let unwrappedResult = try? XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )?.get()

        return unwrappedResult == nil
    }

}

// MARK: - Private

private extension XCTestCase {

    func expect<T: Publisher>(_ publisher: T,
                              timeout: TimeInterval,
                              action: EmptyClosure?) -> Result<T.Output, Error>? {
        var result: Result<T.Output, Error>?
        let expectation = self.expectation(description: "Awaiting publisher")

        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }

                expectation.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )

        action?()

        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        return result
    }

}
