//
//  CatalogView.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import SwiftUI

public struct CatalogView: View {

    // MARK: - States

    @ObservedObject var presenter: CatalogPresenter

    @State private var detailSelected: CatalogItem?

    // MARK: - View

    public var body: some View {
        List {
            ForEach(presenter.items, id: \.id) { item in
                Button(action: {
                    detailSelected = item
                }, label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            presenter.removeItem(item)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .disabled(!item.canRemoveFromCart)
                        Button(action: {
                            presenter.addItem(item)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
            }
        }.toolbar {
            presenter.cartLinkBuilder {
                Image(systemName: "cart")
                Text("\(presenter.cartTotal)")
            }
            .disabled(presenter.cartTotal == 0)
        }
        .sheet(item: $detailSelected) { item in
            presenter.buildDetails(for: item)
        }
    }
}
