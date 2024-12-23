//
//  CatalogInteractor.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart

final class CatalogInteractor {

    let model: Model

    init(model: Model) {
        self.model = model
    }

    func addItem(_ item: CatalogItem) {
        model.addItem(.init(title: item.title))
    }

    func removeItem(_ item: CatalogItem) {
        model.removeItem(.init(title: item.title))
    }

}
