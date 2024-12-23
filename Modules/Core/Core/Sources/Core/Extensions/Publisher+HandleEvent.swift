//
//  Copyright © Surf. All rights reserved.
//

import Combine
import Foundation

public extension Publisher {

    /// Печатает в консоль события, происходящие внутри потока.
    /// - parameter tag: Тег для идентификации потока.
    /// - parameter trimOutput: Убирает из вывода значения.
    func debug(_ tag: String, trimOutput: Bool = false) -> AnyPublisher<Output, Failure> {
        handleEvents(receiveSubscription: { _ in
            debugPrint("\(tag): Subscription")
        }, receiveOutput: { output in
            if trimOutput {
                debugPrint("\(tag): Output")
            } else {
                debugPrint("\(tag): Output - \(output)")
            }
        }, receiveCompletion: { completion in
            debugPrint("\(tag): Completion - \(completion)")
        }, receiveCancel: {
            debugPrint("\(tag): Cancel")
        }, receiveRequest: { demand in
            debugPrint("\(tag): Request - \(demand)")
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет `false` в случае успеха в потоке.
    /// - parameter subject: `Subject`, в который будет отправлен `false`.
    func assignFalse<T>(to subject: any Subject<Bool, Never>) -> AnyPublisher<Result<T, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] result in
            guard (try? result.get()) != nil else {
                return
            }
            subject?.send(false)
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет `true` в случае успеха в потоке.
    /// - parameter subject: `Subject`, в который будет отправлен `true`.
    func assignTrue<T>(to subject: any Subject<Bool, Never>) -> AnyPublisher<T, Never>
    where Output == T, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] _ in
            subject?.send(true)
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет `Void` в случае успеха в потоке.
    /// - parameter subject: `Subject`, в который будет отправлен `Void`.
    func assignVoid<T>(to subject: any Subject<Void, Never>) -> AnyPublisher<Result<T, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] result in
            guard (try? result.get()) != nil else {
                return
            }
            subject?.send(())
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет успешный результат в `Subject`.
    ///  - parameter subject: `Subject`, в который будет отправлен результат.
    ///  Например, `PassthroughSubject` или `CurrentValueSubject`.
    func assignResult<T>(to subject: any Subject<T?, Never>) -> AnyPublisher<Result<T, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] result in
            guard let result = try? result.get() else {
                return
            }
            subject?.send(result)
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет успешный результат в `Subject`.
    ///  - parameter subject: `Subject`, в который будет отправлен результат.
    ///  Например, `PassthroughSubject` или `CurrentValueSubject`.
    func assignResult<T>(to subject: any Subject<T, Never>) -> AnyPublisher<Result<T, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] result in
            guard let result = try? result.get() else {
                return
            }
            subject?.send(result)
        })
        .eraseToAnyPublisher()
    }

    /// Отправляет значение по ключу в `Subject`.
    /// - parameter keyPath: Ключ пути к значению в результате.
    /// - parameter subject: `Subject`, в который будет отправлено значение.
    func assignResult<T, R>(at keyPath: KeyPath<T, R>,
                            to subject: any Subject<R?, Never>) -> AnyPublisher<Result<T, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        handleEvents(receiveOutput: { [weak subject] result in
            guard let result = try? result.get() else {
                return
            }
            subject?.send(result[keyPath: keyPath])
        })
        .eraseToAnyPublisher()
    }

}
