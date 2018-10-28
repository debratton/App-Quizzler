//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber:Int = 0
    var displayQuestionNumber:Int = 1
    var score:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    func updateUI() {
        let currentCount = allQuestions.list.count
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(displayQuestionNumber) / \(currentCount)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(currentCount)) * CGFloat(displayQuestionNumber)
    }
    
    func nextQuestion(value:Int) {
        let questionCount = allQuestions.list.count
        if value < questionCount {
            questionLabel.text = allQuestions.list[value].questionText
        } else {
            
            let alert = UIAlertController(title: "Quiz Complete", message: "Would you like to take the quiz again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        let answerCount = allQuestions.list.count
        if questionNumber < answerCount {
            let correctAnswer = allQuestions.list[questionNumber].answer
            if displayQuestionNumber < answerCount {
                displayQuestionNumber += 1
            }
            if correctAnswer == pickedAnswer {
                score += 1
                updateUI()
                print("Question \(questionNumber): Correct")
                ProgressHUD.showSuccess("Correct!")
            } else {
                updateUI()
                print("Question \(questionNumber): Incorrect - Dummy")
                ProgressHUD.showError("Wrong!")
            }
            questionNumber += 1
            nextQuestion(value: questionNumber)
        }
    }
    
    func startOver() {
        questionNumber = 0
        displayQuestionNumber = 1
        score = 0
        let currentCount = allQuestions.list.count
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(displayQuestionNumber) / 13"
        //progressBar.frame.size.width = CGFloat(1)
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(currentCount)) * CGFloat(displayQuestionNumber)
        nextQuestion(value: questionNumber)
    }
    

    
}
