//
//  CatalogView.swift
//  MVVMFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public struct CatalogView: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: CatalogViewModel

    // MARK: - Init

    init() {}

    // MARK: - View

    public var body: some View {
        List {
            ForEach(viewModel.allItems, id: \.id) { item in
                Button(action: {
                    viewModel.showDetail(item)
                }, label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            viewModel.removeItem(item)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .disabled(!viewModel.cartItems.contains(item))
                        Button(action: {
                            viewModel.addItem(item)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
            }
        }.toolbar {
            Button(action: {
                viewModel.showCart()
            }, label: {
                Image(systemName: "cart")
                Text("\(viewModel.cartItems.count)")
            })
            .disabled(viewModel.cartItems.isEmpty)
        }
    }
}
