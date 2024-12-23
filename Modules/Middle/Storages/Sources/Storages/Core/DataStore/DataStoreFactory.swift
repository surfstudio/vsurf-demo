//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Фабрика для создания хранилища, реализаций `DataStore`
public enum DataStoreFactory {

    /// Параметры определющие тип хранилища и его место
    public enum Params {
        /// Хранение в файле. Использует `FileManager`
        ///  - parameter urlPath: Путь до конкретного файла.
        case file(urlPath: URL)
        /// Хранение в Keychain.
        ///  - parameter service: Название сервиса внутри keychain.
        ///  - parameter key: Ключ для хранения значения.
        case keychain(service: String, key: String)
        /// Хранение в UserDefaults.
        ///  - parameter suiteName: Имя подпапки в UserDefaults. Если nil, то будет использоваться `UserDefaults.standard`
        ///  - parameter key: Ключ для хранения значения.
        case userDefaults(suiteName: String?, key: String)
    }

    /// - parameter params: Входные параметры определющие тип хранилища и его место
    /// - returns: Проинициализированная реализация `DataStore`
    public static func provide(with params: Params) -> any DataStore {
        switch params {
        case .file(let urlPath):
            return FileDataStore(urlPath: urlPath)
        case .userDefaults(let suiteName, let key):
            return UserDefaultsDataStore(suiteName: suiteName, key: key)
        case .keychain(let service, let key):
            return KeychainDataStore(service: service, key: key)
        }
    }

}
