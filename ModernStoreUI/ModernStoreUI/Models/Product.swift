//
//  Product.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//


import Foundation

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating

    struct Rating: Codable, Hashable {
        let rate: Double
        let count: Int
    }
}
