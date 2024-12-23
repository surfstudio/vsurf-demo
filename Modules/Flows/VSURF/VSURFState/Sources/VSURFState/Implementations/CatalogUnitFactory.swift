//
//  CatalogUnitFactory.swift
//  VSURFState
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Cart

enum CatalogUnitFactory {

    public static func produce() -> CatalogUnitOutput {
        return CatalogUnit(items: [
            "Item 1",
            "Item 2",
            "Item 3",
            "Item 4",
            "Item 5",
            "Item 6",
            "Item 7",
            "Item 8",
            "Item 9",
            "Item 10"
        ].map { Item(title: $0) })
    }

}
