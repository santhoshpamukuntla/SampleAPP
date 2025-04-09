//
//  ProductDetailView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @ObservedObject var viewModel: StoreViewModel
//    @State private var isFavorite = false
    var isInCart: Bool {
        viewModel.cart.keys.contains(product)
    }
    @State private var showFullDescription = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Product Image
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 250)
                }

                // Title + Favorite
                HStack {
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        if isInCart {
                            viewModel.removeFromCart(product)
                        } else {
                            viewModel.addToCart(product)
                        }
                    } label: {
                        Image(systemName: isInCart ? "heart.fill" : "heart")
                            .foregroundColor(isInCart ? .red : .gray)
                            .font(.title2)
                    }
                }

                // Rating & Stock
                HStack(spacing: 12) {
                    Label("\(product.rating.rate, specifier: "%.1f")", systemImage: "star.fill")
                        .foregroundColor(.yellow)
                    Text("(\(product.rating.count) reviews)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("In Stock")
                        .font(.caption)
                        .foregroundColor(.green)
                }

                Divider()

                // Price
                VStack(alignment: .leading) {
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title2).bold()
                    Text("or $\(product.price / 6, specifier: "%.2f") / mo for 6 months")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Divider()

                // Description
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    Text(product.description)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.body)
                    Button(action: {
                        showFullDescription.toggle()
                    }) {
                        Text(showFullDescription ? "Read less" : "Read more")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }

                // Add to Cart Button
                Button(action: {
                    viewModel.addToCart(product)
                }) {
                    Text("Add to Cart")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                // Delivery Info
                Text("Estimated delivery: April 12 - April 16")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
            }
            .padding()
        }
        .navigationTitle("Product Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
