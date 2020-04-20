//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Abdul Haseeb on 17/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
   
    let asset_id_quote: String
    let rate : Double
    var rateString : String {
           return String(format: "%.2f", rate)
       }
       
}
