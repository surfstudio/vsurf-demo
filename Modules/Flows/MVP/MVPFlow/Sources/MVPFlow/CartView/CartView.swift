//
//  CartView.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

struct CartView: View {

    // MARK: - State

    @Binding var items: [(Item, Int)]

    // MARK: - Properties

    weak var output: CartViewOutput?

    // MARK: - Init

    init(items: Binding<[(Item, Int)]>, output: CartViewOutput?) {
        self._items = items
        self.output = output
    }

    // MARK: - View

    var body: some View {
        ForEach(items, id: \.0.id) { item, count in
            HStack {
                Text(item.title)
                Text("\(count)")
            }
        }
        Divider()
        Button(action: {
            output?.buy()
        }, label: {
            Text("Buy all")
        })
        .navigationTitle("Cart")
    }

}
