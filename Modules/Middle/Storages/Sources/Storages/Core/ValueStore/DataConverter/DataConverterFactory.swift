//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Фабрика для создания кодера/декодера `DataConverter`
public enum DataConverterFactory {

    /// Формат или тип кодирования
    public enum Format {
        /// JSON
        case json
        /// PropertyList.
        case plist
    }

    /// - parameter format: Формат или тип кодирования
    /// - returns: Проинициализированная реализация `DataConverter`
    public static func provide(with format: Format) -> any DataConverter {
        switch format {
        case .json:
            // При необходимости можно настоить keydecodingStrategy и прочие опции
            // или даже вынести их в параметры enum
            let decoder = JSONDecoder()
            let encoder = JSONEncoder()
            return JSONDataConverter(decoder: decoder, encoder: encoder)
        case .plist:
            // При необходимости можно настоить outputFormat и прочие опции
            // или даже вынести их в параметры enum
            let decoder = PropertyListDecoder()
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .binary
            return PlistDataConverter(decoder: decoder, encoder: encoder)
        }
    }

}
