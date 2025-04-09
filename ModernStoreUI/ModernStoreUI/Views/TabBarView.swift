//
//  TabBarView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 09/04/25.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel = StoreViewModel()

    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            Text("Catalog")
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Catalog")
                }

            CartView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .badge(viewModel.cartCount())

            Text("Favorites")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
