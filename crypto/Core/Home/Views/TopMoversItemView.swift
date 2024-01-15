//
//  TopMoversItemView.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .leading){
            //coin Image
            KFImage(URL(string: coin.image))
                .resizable()
                .foregroundColor(.orange)
                .frame(width: 34, height: 34)
                .padding(.bottom,8)
            //coin Info
            HStack(spacing:2){
                Text(coin.symbol.uppercased())
                    .fontWeight(.bold)
                    .font(.caption)
                Text(coin.currentPrice.toCurrency())
                    .foregroundStyle(.gray)
                    .font(.caption)
                
            }
            // coin percent change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(.green)

        }
        .padding()
        .frame(width: 140, height: 140)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 2)
        }
    }
}

//#Preview {
//    TopMoversItemView()
//}
