//
//  CartView.swift
//  MVVMFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

struct CartView: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: CartViewModel

    // MARK: - Init

    init() {}

    // MARK: - View

    var body: some View {
        ForEach(viewModel.cartItems, id: \.0.id) { item, count in
            HStack {
                Text(item.title)
                Text("\(count)")
            }
        }
        Divider()
        Button(action: {
            viewModel.buy()
        }, label: {
            Text("Buy all")
        })
    }

}
