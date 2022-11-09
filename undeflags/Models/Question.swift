//
//  Question.swift
//  undeflags
//
//  Created by Robin LITTIERE on 09/11/2022.
//

import Foundation

class Question {
    var answer, link: String
    var hasBeenQuestion : Bool
    
    init(answer: String, link: String, hasBeenQuestion: Bool) {
        self.answer = answer
        self.link = link
        self.hasBeenQuestion = hasBeenQuestion
    }
    
    
}
