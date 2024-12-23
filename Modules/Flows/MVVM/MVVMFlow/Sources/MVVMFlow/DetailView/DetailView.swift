//
//  DetailView.swift
//  MVVMFlow
//
//  Created by Nikita Korobeinikov on 19.11.2024.
//

import Cart
import Combine
import SwiftUI

public struct DetailView: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: DetailViewModel

    // MARK: - Init

    init() {}

    // MARK: - View

    public var body: some View {
        VStack {
            Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(alignment: .center) {
                        Text(viewModel.item?.title ?? "")
                    }
            Text("\(viewModel.cartCount) in cart")
                .padding(16)
            Button(action: {
                viewModel.addItem()
            }, label: {
                Text("Add to cart")
            }).padding(16)
            Button(action: {
                viewModel.removeItem()
            }, label: {
                Text("Remove from cart")
            }).padding(16)
                .disabled(viewModel.cartCount <= 0)

        }
    }
}
