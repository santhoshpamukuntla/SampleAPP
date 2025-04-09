//
//  StoreViewModel.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import Foundation

class StoreViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var cart: [Product: Int] = [:]

    func loadProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            if let fetched = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    self.products = fetched
                }
            }
        }.resume()
    }

    func addToCart(_ product: Product) {
        cart[product, default: 0] += 1
    }

    func removeFromCart(_ product: Product) {
        cart[product] = nil
    }

    func cartCount() -> Int {
        let count = cart.values.reduce(0, +)
        print("🛒 Cart count: \(count)")
        return count
    }

    func quantity(for product: Product) -> Int {
        cart[product] ?? 0
    }

    func updateQuantity(_ product: Product, amount: Int) {
        cart[product] = max(0, (cart[product] ?? 0) + amount)
        if cart[product] == 0 {
            cart.removeValue(forKey: product)
        }
    }
}
