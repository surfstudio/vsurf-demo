//
//  Copyright © Surf. All rights reserved.
//

import SurfCore
import SwiftUI

/// Модификатор для обработки события тряски устройства
struct DeviceShakeViewModifier: ViewModifier {
    let action: EmptyClosure

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.didShakeEvent)) { _ in
                action()
            }
    }
}

// MARK: - Accessors

public extension View {
    /// Обработка события тряски устройства
    func onShake(perform action: @escaping EmptyClosure) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

// MARK: - Helpers

extension UIDevice {
    static let didShakeEvent = Notification.Name(rawValue: "didShakeEvent")
}

extension UIWindow {
    override open func motionEnded(_ motion: UIEvent.EventSubtype, with _: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.didShakeEvent, object: nil)
        }
    }
}
