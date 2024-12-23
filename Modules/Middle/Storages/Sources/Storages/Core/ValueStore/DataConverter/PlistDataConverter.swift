//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Кодирования/декодирования данных в `PropertyList` формате.
struct PlistDataConverter: DataConverter {

    private let decoder: PropertyListDecoder
    private let encoder: PropertyListEncoder

    init(decoder: PropertyListDecoder, encoder: PropertyListEncoder) {
        self.decoder = decoder
        self.encoder = encoder
    }

    // MARK: - DataConverter

    func encode(_ value: some Encodable) throws -> Data {
        return try encoder.encode(value)
    }

    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try decoder.decode(type, from: data)
    }

}
