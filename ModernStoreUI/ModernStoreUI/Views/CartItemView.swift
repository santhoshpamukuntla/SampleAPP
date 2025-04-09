//
//  CartItemView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import SwiftUI

struct CartItemView: View {
    let product: Product
    let quantity: Int
    let onUpdate: (Int) -> Void

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(1)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()

            HStack {
                Button(action: { onUpdate(-1) }) {
                    Image(systemName: "minus.circle")
                }
                Text("\(quantity)")
                    .frame(width: 30)
                Button(action: { onUpdate(1) }) {
                    Image(systemName: "plus.circle")
                }
            }
            .font(.title3)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
