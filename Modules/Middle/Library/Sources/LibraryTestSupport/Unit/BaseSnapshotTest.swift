//
//  Copyright © Surf. All rights reserved.
//

import PreviewSnapshots
import PreviewSnapshotsTesting
import SnapshotTesting
import SwiftUI
import XCTest

/// Базовый класс для snapshot-тестов компонентов или экранов.
///  Содержит общие предустановки и вспомогательные методы.
///  - Note: Выполняется в **unit**-тест таргете. Не требует app.
open class BaseSnapshotTest: XCTestCase {

    // MARK: - Properties

    private var isRecording = false

    public let darkTraits: UITraitCollection = .init(userInterfaceStyle: .dark)

    public let lightTraits: UITraitCollection = .init(userInterfaceStyle: .light)

    // MARK: - SetUp

    override open func setUp() {
        super.setUp()
        isRecording = ProcessInfo.processInfo.arguments.contains("DEV_SNAPSHOT_REC")
    }

    // MARK: - Public

    /// Сравнивает `View` всех конфигураций с эталонными снапшотами
    /// - parameter configurations: Массив с конфигурациями превью
    /// - parameter snapshotting: Конфигурация снапшота
    public func assertSnapshotImagePreviews(
        of configurations: PreviewSnapshots<some Any>,
        as snapshotting: Snapshotting<AnyView, UIImage>,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        configurations.assertSnapshots(as: snapshotting,
                                       record: isRecording,
                                       file: file,
                                       testName: testName,
                                       line: line)
    }

    /// Сравнивает `View` с эталонным снапшотом
    /// - parameter value: Тестируемая View
    /// - parameter snapshotting: Конфигурация снапшота
    public func assertSnapshotImage<Value: View>(
        of value: Value,
        as snapshotting: Snapshotting<Value, UIImage>,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        assertSnapshot(of: value,
                       as: snapshotting,
                       record: isRecording,
                       file: file,
                       testName: testName,
                       line: line)
    }

    /// Базовая конфигурация для снапшот-тестов.
    /// - parameter precision: Точность.
    /// Процент пикселей, которые должны совпадать.
    /// Допустимые значения [0...1].
    /// - parameter perceptualPrecision: Точность восприятия.
    /// Процент требуемого совпадения при сравнении пикселя с исходным пикселем.
    /// Человеческий глаз имеет точность восприятия 98-99%.
    /// Допустимые значения [0...1].
    /// - parameter traits: UITraitCollection для фиксации параметров контейнера.
    ///  Можно использовать для фиксации светлой/темной темы, используя публичные свойства `darkTraits`, `lightTraits`.
    /// - returns: Настройки снапшот-теста.
    public func snapshoting<Value: View>(precision: Float = 1,
                                         perceptualPrecision: Float = 1,
                                         traits: UITraitCollection) -> Snapshotting<Value, UIImage> {
        return .image(precision: precision,
                      perceptualPrecision: perceptualPrecision,
                      layout: .device(config: SharedConfigurations.mainDeviceConfig),
                      traits: traits)
    }

}
