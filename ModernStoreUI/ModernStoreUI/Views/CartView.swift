//
//  CartView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: StoreViewModel
    @State private var showThankYou = false

    var body: some View {
        NavigationView {
            VStack {
                // Delivery Info
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Deliver to")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("92 High Street, London")
                            .font(.headline)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)

                // Select All Option
                HStack {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("Select All")
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)

                Divider()

                // Cart Items List
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.cart.keys.sorted(by: { $0.id < $1.id }), id: \.self) { product in
                            CartItemView(product: product, quantity: viewModel.quantity(for: product)) {
                                viewModel.updateQuantity(product, amount: $0)
                            }
                        }
                    }
                    .padding()
                }

                Spacer()

                // Checkout Bar
                VStack {
                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text("$\(totalPrice(), specifier: "%.2f")")
                            .font(.headline)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        showThankYou = true
                        viewModel.cart.removeAll()
                    }) {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .navigationTitle("Cart")
            .alert(isPresented: $showThankYou) {
                Alert(title: Text("Thank You!"), message: Text("Your order has been placed."), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func totalPrice() -> Double {
        viewModel.cart.reduce(0) { result, entry in
            result + (entry.key.price * Double(entry.value))
        }
    }
}
