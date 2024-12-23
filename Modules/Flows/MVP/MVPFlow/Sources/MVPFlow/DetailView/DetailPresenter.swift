//
//  DetailPresenter.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public class DetailPresenter: ObservableObject, DetailViewOutput {

    // MARK: - Properties

    let model: Model

    @Published var item: Item?

    @Published var cartCount = 0

    // MARK: - Init

    init(model: Model) {
        self.model = model

        model.cart
            .combineLatest($item)
            .map { cart, item in
                cart.filter { $0 == item }.count
            }
            .assign(to: &$cartCount)
    }

    // MARK: - DetailViewOutput

    func addItem() {
        guard let item else {
            return
        }
        model.addItem(item)
    }

    func removeItem() {
        guard let item else {
            return
        }
        model.removeItem(item)
    }

}
