//
//  HomeViews.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI

struct HomeViews: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                //Top Movers
                TopMoversViews(viewModel: viewModel)
                Divider()
                //All Coins
                AllCoinViews(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeViews()
}
