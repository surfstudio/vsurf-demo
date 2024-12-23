//
//  Copyright © Surf. All rights reserved.
//

import Combine
import Foundation

public extension Publisher {

    /// Трансформирует успешный результат в `Void`.
    /// Ошибка пробрасывается без изменений.
    func mapToVoid<T>() -> AnyPublisher<Result<Void, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        map {
            switch $0 {
            case .success:
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
        }.eraseToAnyPublisher()
    }

    /// Трансформирует успешный результат в значение по ключу.
    /// Ошибка пробрасывается без изменений.
    /// - parameter keyPath: Ключ пути к значению.
    func mapToResult<T, R>(at keyPath: KeyPath<T, R>) -> AnyPublisher<Result<R, any Error>, Never>
    where Output == Result<T, any Error>, Failure == Never {
        map {
            switch $0 {
            case .success(let result):
                return .success(result[keyPath: keyPath])
            case .failure(let error):
                return .failure(error)
            }
        }.eraseToAnyPublisher()
    }

}
