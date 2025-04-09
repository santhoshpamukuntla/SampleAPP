//
//  FlashSaleCard.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import SwiftUI

struct FlashSaleCard: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .cornerRadius(8)
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 120)
            }

            Text(product.title)
                .font(.headline)
                .lineLimit(2)

            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(.green)

            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
                Text(String(format: "%.1f", product.rating.rate))
                    .font(.caption)
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

