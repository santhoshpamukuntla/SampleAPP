//
//  HomeView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: StoreViewModel

    let categories = ["Phones", "Laptops", "Cameras", "Audio", "Watches"]
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {

                    // Top Bar
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Delivery Address")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("92 High Street, Canada")
                                .font(.headline)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                                .font(.title2)
                        }
                    }
                    .padding(.horizontal)

                    // Search Bar
                    TextField("Search the entire shop", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.horizontal, .top])

                    // Promo Banner
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                        .frame(height: 150)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("Free delivery this week!")
                                    .font(.title3).bold()
                                Text("On all orders over $50")
                                    .font(.subheadline)
                            }
                            .padding(),
                            alignment: .leading
                        )
                        .padding(.horizontal)

                    // Categories Section
                    HStack {
                        Text("Categories")
                            .font(.title2).bold()
                        Spacer()
                        Text("See All")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories, id: \.self) { category in
                                VStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 60, height: 60)
                                        .overlay(Text(String(category.prefix(1))))
                                    Text(category)
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)

                    // Flash Sale Header
                    HStack {
                        Text("Flash Sale")
                            .font(.title2).bold()
                        Spacer()
                        Text("See All")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)

                    // Flash Sale Cards
                    LazyVGrid(columns: gridColumns, spacing: 16) {
                        ForEach(viewModel.products) { product in
                            NavigationLink(destination: ProductDetailView(product: product, viewModel: viewModel)) {
                                FlashSaleCard(product: product)
                            }
                        }
                    }
                    .padding(.horizontal)
                } // VStack
                .padding(.top)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        NavigationLink(destination: CartView(viewModel: viewModel)) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "cart")
                                    .font(.title2)
                                if viewModel.cartCount() > 0 {
                                    Text("\(viewModel.cartCount())")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .padding(4)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 8, y: -8)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}
