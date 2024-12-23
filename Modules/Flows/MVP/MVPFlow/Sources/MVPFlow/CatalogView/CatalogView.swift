//
//  CatalogView.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public struct CatalogView: View {

    // MARK: - Input

    @Binding private var items: [Item]
    @Binding private var cart: [Item]

    // MARK: - Properties

    weak var output: CatalogViewOutput?

    // MARK: - Init

    init(items: Binding<[Item]>,
         cart: Binding<[Item]>,
         output: CatalogViewOutput?) {
        self._items = items
        self._cart = cart
        self.output = output
    }

    // MARK: - View

    public var body: some View {
        List {
            ForEach(items, id: \.id) { item in
                Button(action: {
                    output?.showDetail(item)
                }, label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            output?.removeItem(item)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .disabled(!cart.contains(item))
                        Button(action: {
                            output?.addItem(item)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
            }
        }.toolbar {
            Button(action: {
                output?.showCart()
            }, label: {
                Image(systemName: "cart")
                Text("\(cart.count)")
            })
            .disabled(cart.isEmpty)
        }
    }
}
