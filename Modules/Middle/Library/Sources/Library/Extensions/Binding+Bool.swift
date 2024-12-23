//
//  Copyright © Surf. All rights reserved.
//

import SwiftUI

public extension Binding where Value == Bool {
    init(binding: Binding<(some Any)?>) {
        self.init(
            get: {
                binding.wrappedValue != nil
            },
            set: { newValue in
                guard newValue == false else {
                    return
                }
                binding.wrappedValue = nil
            }
        )
    }
}

public extension Binding {
    /// Трансформирует binding с опциональным значением в `Binding<Bool>`.
    func mapToBool<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        Binding<Bool>(binding: self)
    }
}

public extension Binding where Value: Equatable {

    /// Создает binding, который `true` при равенстве значения с переданным.
    /// - parameter value: Значение, с которым сравнивается текущее `wrappedValue`.
    func whenEqual(_ value: Value) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue == value },
            set: { self.wrappedValue = $0 ? value : self.wrappedValue }
        )
    }

}
