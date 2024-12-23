//
//  Copyright © Surf. All rights reserved.
//

import Cart
import Combine
import PreviewSnapshots
import Resources
import SwiftUI

// MARK: - ViewController

public struct MVCViewGroup: View {

    // MARK: - State

    @State private var items: [Item] = []

    @State private var cart: [Item] = []

    @State private var isCartShown = false
    @State private var detailSelected: Item?

    // MARK: - Properties

    private let model = Model()

    // MARK: - Init

    public init() {}

    // MARK: - View

    public var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.id) { item in
                    Button(action: {
                        detailSelected = item
                    }, label: {
                        HStack {
                            Text(item.title)
                            Spacer()
                            Button(action: {
                                model.removeItem(item)
                            }, label: {
                                Image(systemName: "minus")
                            })
                            .disabled(!cart.contains(item))
                            Button(action: {
                                model.addItem(item)
                            }, label: {
                                Image(systemName: "plus")
                            })
                        }
                    })
                }
            }
            .navigationTitle("Items")
            .toolbar {
                Button(action: {
                    isCartShown = true
                }, label: {
                    Image(systemName: "cart")
                    Text("\(cart.count)")
                })
                .disabled(cart.isEmpty)
            }
            .navigationDestination(isPresented: $isCartShown, destination: {
                ForEach(cart.reduce(into: [Item: Int]()) { result, item in
                    result.updateValue((result[item] ?? 0) + 1, forKey: item)
                }.sorted(by: { $0.key.title > $1.key.title }), id: \.key.id) { item, count in
                    HStack {
                        Text(item.title)
                        Text("\(count)")
                    }
                }
                Divider()
                Button(action: {
                    isCartShown = false
                    model.removeAll()
                }, label: {
                    Text("Buy all")
                })
                .navigationTitle("Cart")
            })
        }
        .sheet(item: $detailSelected) { item in
            VStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(alignment: .center) {
                        Text(item.title)
                    }
                Text("\(cart.filter { item == $0 }.count) in cart")
                    .padding(16)
                Button(action: {
                    model.addItem(item)
                }, label: {
                    Text("Add to cart")
                }).padding(16)
                Button(action: {
                    model.removeItem(item)
                }, label: {
                    Text("Remove from cart")
                }).padding(16)
                .disabled(!cart.contains(item))

            }
        }
        .onReceive(model.all) { items in
            self.items = items
        }
        .onReceive(model.cart) { cart in
            self.cart = cart
        }
    }

}
