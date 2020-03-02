//
//  Question.swift
//  Quizzler
//
//  Created by Mohamed Abd el Aty on 2/13/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
import Foundation
class Question {
    let questionText : String
    let answer : Bool
    init(text: String , correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
