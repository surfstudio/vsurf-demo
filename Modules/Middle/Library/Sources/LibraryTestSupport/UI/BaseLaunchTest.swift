//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import SwiftUI
import XCTest

/// Базовый класс для performance тестов запуска приложения.
///  Содержит общие предустановки и вспомогательные методы.
///  - Note: Выполняется в **UI**-тест таргете. Требует app.
///  Скорее всего будет в единственном экземляре на таргет.
open class BaseLaunchTest: XCTestCase {

    // MARK: - Methods

    public func assertLaunch() {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }

}
