//
//  DetailView.swift
//  MVPFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public struct DetailView: View {

    // MARK: - Input

    var item: Item
    @Binding var cartCount: Int

    // MARK: - Properties

    weak var output: DetailViewOutput?

    // MARK: - Init

    init(item: Item,
         cartCount: Binding<Int>,
         output: DetailViewOutput?) {
        self.item = item
        self._cartCount = cartCount
        self.output = output
    }

    // MARK: - View

    public var body: some View {
        VStack {
            Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(alignment: .center) { Text(item.title)
                    }
            Text("\(cartCount) in cart")
                .padding(16)
            Button(action: {
                output?.addItem()
            }, label: {
                Text("Add to cart")
            }).padding(16)
            Button(action: {
                output?.removeItem()
            }, label: {
                Text("Remove from cart")
            }).padding(16)
                .disabled(cartCount <= 0)

        }
    }
}
