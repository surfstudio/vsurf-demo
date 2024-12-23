//
//  CartInteractor.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart

final class CartInteractor {

    let model: Model

    init(model: Model) {
        self.model = model
    }

    func buy() {
        model.removeAll()
    }

}
