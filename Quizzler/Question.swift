//
//  Question.swift
//  Quizzler
//
//  Created by David E Bratton on 10/28/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

// CREATE NEW CLASS
class Question {
    // DEFINE TWO PROPERTIES OF CLASS
    let questionText: String
    let answer: Bool
    
    // ALWAYS HAVE TO INITIALIZE THE CLASS PROPERTIES
    init(text:String, correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }
}
