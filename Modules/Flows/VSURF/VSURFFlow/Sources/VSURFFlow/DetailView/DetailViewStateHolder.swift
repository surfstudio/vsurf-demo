//
//  DetailViewStateHolder.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import Combine
import Foundation
import VSURFState

final class DetailViewStateHolder: ObservableObject {

    // MARK: - Private Properties

    private var cancellables: Set<AnyCancellable> = []
    private var cartUnit: CartUnitInput & CartUnitOutput

    private let item: String

    // MARK: - Published

    @Published var state: DetailView.ViewState = .init(title: "",
                                                       cartCount: 0,
                                                       canRemoveFromCart: false)

    // MARK: - Init

    init(item: String, cartUnit: CartUnitInput & CartUnitOutput) {
        self.item = item
        self.cartUnit = cartUnit
        subscribe()
    }

}

// MARK: - ViewOutput

extension DetailViewStateHolder: DetailViewOutput {

    func addItem() {
        cartUnit.addItem(.init(title: item))
    }

    func removeItem() {
        cartUnit.removeItem(.init(title: item))
    }

}

// MARK: - Private Methods

private extension DetailViewStateHolder {

    func subscribe() {

        cartUnit.items
            .receive(on: DispatchQueue.main)
            .map { items in
                items.filter { $0.title == self.item }
            }
            .map { items -> DetailView.ViewState in
                .init(title: self.item,
                      cartCount: items.count,
                      canRemoveFromCart: !items.isEmpty
                )
            }
            .assign(to: \.state, on: self)
            .store(in: &cancellables)

    }

}
