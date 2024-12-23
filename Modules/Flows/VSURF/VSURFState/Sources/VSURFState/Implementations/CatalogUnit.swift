//
//  CatalogUnit.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Combine
import Cart

final class CatalogUnit {

    // MARK: - Private Properties

    private let localItems: [Item]

    // MARK: - Init

    init(items: [Item]) {
        self.localItems = items
    }

}

// MARK: - CatalogUnitOutput

extension CatalogUnit: CatalogUnitOutput {

    var items: AnyPublisher<[Item], Never> {
        Just(localItems).eraseToAnyPublisher()
    }

}
