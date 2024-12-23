//
//  Copyright © Surf. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import SwiftUI
import XCTest

/// Базовый класс для UI тестов нацеленных на аудит a11y.
///  Содержит общие предустановки и вспомогательные методы.
///  - Note: Выполняется в **UI**-тест таргете. Требует app.
/// По плану теста надо накликать, либо задиплинкать до нужного экрана и вызвать `assertAccessibility`.
@available(iOS 17.0, *)
open class BaseAccessibilityTest: XCTestCase {

    // MARK: - Properties

    public var app: XCUIApplication!

    // MARK: - Setup

    override open func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }

    // MARK: - Methods

    public func assertAccessibility(for auditTypes: XCUIAccessibilityAuditType = .all,
                                    _ issueHandler: ((XCUIAccessibilityAuditIssue) throws -> Bool)? = nil) throws {
        try app.performAccessibilityAudit(for: auditTypes, issueHandler)
    }

}
