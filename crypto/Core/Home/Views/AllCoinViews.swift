//
//  AllCoinViews.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI

struct AllCoinViews: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("All Coin")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .padding(.vertical,0)
            .padding(.horizontal)
            .foregroundColor(.gray)
            .font(.caption)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

//#Preview {
//    AllCoinViews()
//}
