//
//  HomeViewModel.swift
//  crypto
//
//  Created by Durgesh Singh on 14/01/24.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    init(){
        fetchCoinData()
    }
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ data, respose, error in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            if let respose = respose as? HTTPURLResponse{
                print("DEBUG: Respose code \(respose.statusCode)")
            }
            
            guard let data = data else { return }
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async{
                    self.coins = coins
                    self.configureTopMovingCoin()
                }
            }catch let error{
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }.resume()
    }
    func configureTopMovingCoin(){
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H >
            $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
