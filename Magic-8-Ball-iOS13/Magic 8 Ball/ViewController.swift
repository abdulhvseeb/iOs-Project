//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit





class ViewController: UIViewController {
    
    @IBOutlet weak var magicBall: UIImageView!
    
    
    func updateMagicBall() {
         let ballArray = [#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball2")]
        magicBall.image = ballArray.randomElement()

    }
   

    @IBAction func askButtonPressed(_ sender: Any) {
        
        updateMagicBall()
    }
    
}

