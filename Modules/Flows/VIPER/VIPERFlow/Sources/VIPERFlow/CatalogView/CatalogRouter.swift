//
//  CatalogRouter.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import SwiftUI
import Cart

final class CatalogRouter {

    func makeCartView(using model: Model) -> some View {
        return CartView(presenter:
                .init(interactor: .init(model: model))
        )
    }

    func makeDetailView(for item: CatalogItem, using model: Model) -> some View {
        return DetailView(presenter:
                .init(interactor: .init(model: model,
                                        itemId: item.id)
                )
        )
    }

}
