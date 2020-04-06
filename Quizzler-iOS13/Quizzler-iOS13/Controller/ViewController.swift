//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var barProgressLabel: UIProgressView!
    
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var optionThree: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        barProgressLabel.progress = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAns(userAnswer)
        
        
        let nextQuestion = quizBrain.nextQuestion()
        if nextQuestion {
            updateUI()
        }
        
        if userGotItRight {
            
            sender.backgroundColor = UIColor.green
        }
        else {
            
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        barProgressLabel.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.scoreUpdate())"
        
        optionOne.setTitle(quizBrain.getAnswersText(), for: .normal)
        optionTwo.setTitle(quizBrain.getAnswersText(), for: .normal)
        optionThree.setTitle(quizBrain.getAnswersText(), for: .normal)
        
        
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
    }
    
    
    
    
}
