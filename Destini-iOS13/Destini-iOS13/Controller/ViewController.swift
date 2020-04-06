//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    
    let story0 =  "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'."
    
    let choice1 = "I'll hop in. Thanks for the help!"
    
    
    let choice2 = "Better ask him if he's a murderer first."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = story0
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
        
        
    }
    
    var storyBrain = StoryBrain()
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let choiceAnswer = sender.currentTitle!
        storyBrain.nextStory(choiceAnswer)
        updateUI()
    }
    
    func updateUI(){
        choice1Button.setTitle(storyBrain.getOption1(), for: .normal)
        
        choice2Button.setTitle(storyBrain.getOption2(), for: .normal)
        storyLabel.text = storyBrain.getText()
       
        
        
        
    }
    
}

