//
//  Copyright © Surf. All rights reserved.
//

import Foundation

/// Кодирования/декодирования данных в `JSON` формате.
struct JSONDataConverter: DataConverter {

    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(decoder: JSONDecoder, encoder: JSONEncoder) {
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
