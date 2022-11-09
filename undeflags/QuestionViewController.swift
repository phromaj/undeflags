//
//  QuestionViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit
import WebKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var flagWebView: WKWebView!
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let player = PlayerDataManager.shared.player
        
        var questions : [Question] = []
        
        for (index, flag) in DataManager.shared.flags!.enumerated() {
            
    
            var question: Question = Question(answer: "\(flag.name) \(flag.year)",
                                              link: DataManager.shared.svgLinks![index],
                                              index: index,
                                              hasBeenQuestion: false)
            questions.append(question)
        }
        
        var selectedQuestion = questions.randomElement()
        
        if selectedQuestion.hasBeenQuestion {
            
        }
        
        self.reloadWebView(urlString: selectedQuestion!.link)
        
        // Choose a random question
        
        // On va l'afficher
        
        // On change la propriété de la question "hasbeenQuestion" en true
        
        // On affiche
                
    }
    
    func reloadWebView(urlString: String ){
          let url = URL(string: urlString)!
          let request = URLRequest(url: url)
          self.flagWebView.load(request)
      }

}
