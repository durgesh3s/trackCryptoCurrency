//
//  TopMoversViews.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI

struct TopMoversViews: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:16){
                    ForEach(viewModel.topMovingCoins ){ coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    TopMoversViews()
//}
