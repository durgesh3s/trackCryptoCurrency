//
//  CoinRowView.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack{
            //Index
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            
            //coin image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 34,height: 34)
                .foregroundColor(.orange)
            
            //coin namge
            VStack(alignment:.leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    
            }
            
            Spacer()
            //coin percentage
            VStack(alignment:.trailing){
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("\(coin.priceChange24H)")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .padding(.vertical, -5)
    }
}

//#Preview {
//    CoinRowView()
//}
