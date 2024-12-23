//
//  CartView.swift
//  VIPERFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import SwiftUI

struct CartView: View {

    // MARK: - States

    @ObservedObject var presenter: CartPresenter

    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    // MARK: - View

    var body: some View {
        ForEach(presenter.items, id: \.0) { item, count in
            HStack {
                Text(item)
                Text("\(count)")
            }
        }
        Divider()
        Button(action: {
            presenter.buy()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Buy all")
        })
        .navigationTitle("Cart")
    }

}
