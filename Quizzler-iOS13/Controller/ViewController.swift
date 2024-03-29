//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
   
    @IBOutlet weak var firstChoiceButtom: UIButton!
    @IBOutlet weak var secondChoiceButtom: UIButton!
    @IBOutlet weak var thridChoiceButtom: UIButton!
    
    @IBOutlet weak var QuestionText: UILabel!
    
   
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func anserButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        
         Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)
       
    }
    @objc func updateUI() {
        QuestionText.text = quizBrain.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        firstChoiceButtom.setTitle(answerChoices[0], for: .normal)
        secondChoiceButtom.setTitle(answerChoices[1], for: .normal)
        thridChoiceButtom.setTitle(answerChoices[2], for: .normal)
        ProgressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstChoiceButtom.backgroundColor = UIColor.clear
        secondChoiceButtom.backgroundColor = UIColor.clear
        
        //Third button needs to be reset too.
        thridChoiceButtom.backgroundColor = UIColor.clear
    }
    

}

