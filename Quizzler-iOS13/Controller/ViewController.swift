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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerIsRight = quizBrain.checkAnswer(answer: sender.currentTitle!)
        
        if (answerIsRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.changeScreenQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        choice1.setTitle(quizBrain.getChoiceText(position: 0), for: .normal)
        choice2.setTitle(quizBrain.getChoiceText(position: 1), for: .normal)
        choice3.setTitle(quizBrain.getChoiceText(position: 2), for: .normal)
        
        questionLabel.text = quizBrain.getCurrentText()
        progressBar.progress = quizBrain.getCurrentProgress()
        scoreLabel.text = "Score \(quizBrain.correctAnswers)"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
}

