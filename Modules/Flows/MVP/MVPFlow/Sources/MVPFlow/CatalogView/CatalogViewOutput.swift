//
//  CatalogViewOutput.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart

protocol CatalogViewOutput: AnyObject {
    func addItem(_ item: Item)
    func removeItem(_ item: Item)

    func showDetail(_ item: Item)
    func showCart()
}
