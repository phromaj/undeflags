//
//  QuestionViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let user = UserDefaults.standard.data(forKey: "player") {
//            do {
//                // Create JSON Decoder
//                let decoder = JSONDecoder()
//
//                // Decode Note
//                let player = try decoder.decode(Player.self, from: user)
//                print(player)
//
//            } catch {
//                print("Unable to Decode Note (\(error))")
//            }
//        }
        let player = PlayerDataManager.shared.player
        var questions : [Question] = []
        for (index, flag) in DataManager.shared.flags!.enumerated() {
            var question: Question
            switch flag.name {
                case "lesbian":
                    var answer = flag.name + " " + flag.year
                    question = Question(answer: answer, link: DataManager.shared.svgLinks![index], hasBeenQuestion: false)
                case "pride":
                    var answer = flag.name + " " + flag.year
                    question = Question(answer: answer, link: DataManager.shared.svgLinks![index], hasBeenQuestion: false)
                default:
                    var answer = flag.name + " " + flag.year
                    question = Question(answer: answer, link: DataManager.shared.svgLinks![index], hasBeenQuestion: false)
            }
            questions.append(question)
        }
    
        
        // Choose a random question
        
        // On va l'afficher
        
        // On change la propriété de la question "hasbeenQuestion" en true
        
        // On affiche
                
    }

}
