//
//  DetailsView.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import SwiftUI

public struct DetailView: View {

    // MARK: - States

    @ObservedObject var presenter: DetailsPresenter

    // MARK: - View

    public var body: some View {
        VStack {
            Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(alignment: .center) { Text(presenter.item.title)
                    }
            Text("\(presenter.cartCount) in cart")
                .padding(16)
            Button(action: {
                presenter.addItem()
            }, label: {
                Text("Add to cart")
            }).padding(16)
            Button(action: {
                presenter.removeItem()
            }, label: {
                Text("Remove from cart")
            }).padding(16)
                .disabled(!presenter.item.canRemoveFromCart)

        }
    }
}
