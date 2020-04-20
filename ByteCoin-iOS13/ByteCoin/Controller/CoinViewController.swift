//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return coinManager.currencyArray.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
    }
    
    
    var coinManager = CoinManager()
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        
    }
    
}



// MARK: - CoinManagerDelegate

extension CoinViewController: CoinManagerDelegate {
    
    func didUpdateBitCoin(_ coinManager: CoinManager, bitcoin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = "\(bitcoin.rateString)"
            self.currencyLabel.text = bitcoin.asset_id_quote
        }
    }
    
    
    func didFailError(error: Error) {
        print(error)
    }
    
    
}

