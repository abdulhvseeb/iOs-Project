//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateBitCoin(_ coinManager : CoinManager , bitcoin: CoinModel)
    func didFailError(error:Error)
}



struct CoinManager {
    
    var delegate : CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "CF460C1D-AB41-43B7-B4EA-9DF03723B2F1"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getCoinPrice(for currency: String)  {
        
        let urlCoin = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        performRequest(with: urlCoin)
        
    }
    
    
    func performRequest(with urlCoin:String)  {
        
        if let url = URL(string: urlCoin) {
            //2. create a url session
            let session = URLSession(configuration: .default)
            //3. Give Session the task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailError(error: error!)
                    return
                }
                if let safeData = data {
                    
                    if let bitcoin = self.parseJSON(safeData){
                        self.delegate?.didUpdateBitCoin(self, bitcoin: bitcoin)
                    }
                }
                
                
                
                
            }
            task.resume()
            
            
            
            
        }
    }
    
    
    
    func parseJSON(_ coinData:Data) -> CoinModel?  {
        let decoder = JSONDecoder()
        do {
            let  decodedData = try decoder.decode(CoinData.self, from: coinData)
            
            
            let assetIDQoute = decodedData.asset_id_quote
            let rate = decodedData.rate
            
            let coinModel = CoinModel(asset_id_quote: assetIDQoute, rate: rate)
            
            return coinModel
            
            
        }
        catch{
            delegate?.didFailError(error: error)
            return nil
        }
        
    }
    
}
    
    

