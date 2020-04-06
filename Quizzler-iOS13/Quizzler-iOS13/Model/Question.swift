//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Abdul Haseeb on 04/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
       let question : String
       let answer : [String]
    let correctAns : String
    init(q:String , a:[String] , correctAnswer:String)
    {
        self.question = q
        self.answer = a
        self.correctAns = correctAnswer
        
    }
    
   }
