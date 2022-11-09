//
//  Question.swift
//  undeflags
//
//  Created by Robin LITTIERE on 09/11/2022.
//

import Foundation

class Question {
    var answer, link: String
    var index: Int
    var hasBeenQuestion : Bool
    
    init(answer: String, link: String, index: Int, hasBeenQuestion: Bool) {
        self.answer = answer
        self.link = link
        self.index = index
        self.hasBeenQuestion = hasBeenQuestion
    }
    
}
