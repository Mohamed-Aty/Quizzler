//
//  Question.swift
//  Quizzler
//
//  Created by Mohamed Abd el Aty on 2/13/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var quetionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
         if sender.tag == 1 {
                 pickedAnswer = true
             }
             else if sender.tag == 2 {
                 pickedAnswer = false
             }
             
            checkAnswer()
             
            quetionNumber = quetionNumber + 1
            nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(quetionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(quetionNumber + 1)
    }
    
    func nextQuestion() {
        
        if quetionNumber <= 12
        {
            questionLabel.text = allQuestions.list[quetionNumber].questionText
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "AWeSome", message: "You've finished all question ,do you want to start over ?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default,handler:  { (UIAlertAction) in
                
                self.startOver()
            
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() { let correctAnswer = allQuestions.list[quetionNumber].answer
                if correctAnswer == pickedAnswer {
                
                    ProgressHUD.showSuccess("AWESOME, Correct Answer")
                    print("we did it ")
                    score = score + 1
                    
                    
                }  else  {
                    ProgressHUD.showError("Ooooh, Wrong Answer")
                    print("Wrong!")
                    
                }
                
    }
        
    func startOver() {
        score = 0
        quetionNumber = 0
        nextQuestion()
       
    }
}
