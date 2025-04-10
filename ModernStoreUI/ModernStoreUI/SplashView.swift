//
//  SplashView.swift
//  ModernStoreUI
//
//  Created by Santhosh P on 10/04/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            TabBarView() // Your main app entry point
        } else {
            VStack {
                Image(systemName: "bag.fill") // Replace with your logo
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                Text("ShopEasy")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onAppear {
                // Delay for 2 seconds before showing the app
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
