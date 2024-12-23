//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import SurfCore

/// Обертка над событием.
/// Кроме `DispatchWorkItem` держит в себе полезную нагрузку.
private final class DebouncerRequest<Payload> {
    let payload: Payload
    let workItem: DispatchWorkItem

    init(payload: Payload, workItem: DispatchWorkItem) {
        self.payload = payload
        self.workItem = workItem
    }
}

/// Выполняет события с задержкой.
/// Может запоминать любую информацию, связанную с событием.
public final class Debouncer<Payload> {

    private var requests: [String: DebouncerRequest<Payload>] = [:]

    public init() {}

    /// Отправляет события в очередь на выполнение.
    /// - Parameters:
    ///   - id: Уникальный ID события.
    ///   - payload: Любая полезная нагрузка.
    ///   - queue: Очередь, на которой будет выполнено события.
    ///   - delay: Задержка перед выполнением.
    ///   - action: Действие, которое нужно выполнить после задержки.
    public func run(id: String,
                    payload: Payload,
                    on queue: DispatchQueue,
                    delay: DispatchTimeInterval,
                    action: @escaping EmptyClosure) {
        requests[id]?.workItem.cancel()

        let workItem = DispatchWorkItem { [weak self] in
            action()
            self?.requests[id] = nil
        }

        let request = DebouncerRequest(payload: payload, workItem: workItem)
        queue.asyncAfter(deadline: .now() + delay, execute: workItem)

        requests[id] = request
    }

    /// Отменяет события и удаляет его из очереди выполнения.
    /// - Parameter id: Уникальный ID события.
    /// - Returns: Вернет полезную нагрузку связанную с этим событием.
    public func cancel(by id: String) -> Payload? {
        requests[id]?.workItem.cancel()
        let payload = requests[id]?.payload

        requests[id] = nil

        return payload
    }

}
