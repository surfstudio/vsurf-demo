//
//  CatalogItem.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

struct CatalogItem: Identifiable {
    let title: String
    let canRemoveFromCart: Bool

    var id: String { title }
}
