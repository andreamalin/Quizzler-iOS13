//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Andrea Amaya on 7/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var correctAnswers = 0
    var questionOnScreen = 0
    
    let questions = [
        Question(text: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(text: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
               Question(text: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(text: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(text: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(text: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(text: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(text: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(text: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(text: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == questions[questionOnScreen].correctAnswer {
            correctAnswers += 1
            return true
        }
        return false
    }
    
    mutating func changeScreenQuestion() {
        if (questionOnScreen + 1 < questions.count) {
            questionOnScreen += 1
        } else {
            correctAnswers = 0
            questionOnScreen = 0
        }
    }
    
    func getCurrentText() -> String {
        return questions[questionOnScreen].text
    }
    
    func getCurrentProgress() -> Float {
        return Float(questionOnScreen) / Float(questions.count)
    }
    
    func getChoiceText(position: Int) -> String {
        return questions[questionOnScreen].answer[position]
    }
}
