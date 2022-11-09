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
    var selectedQuestion: Question
    var count: Int = 1
    var questions : [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var buttons: [UIButton] = []
        buttons.append(answer1Button)
        buttons.append(answer2Button)
        buttons.append(answer3Button)

        
        
        
        
        for (index, flag) in DataManager.shared.flags!.enumerated() {
            var question: Question = Question(answer: "\(flag.name) \(flag.year)",
                                              link: DataManager.shared.svgLinks![index],
                                              index: index,
                                              hasBeenQuestion: false)
            questions.append(question)
        }
        
        // Choose random question
        selectedQuestion = selectQuestion(questions: questions)
        
        // Update UI
        self.changeButtonTitle(buttons: buttons, previousQuestion: selectedQuestion, questions: questions)
        self.reloadWebView(urlString: selectedQuestion.link)
    }
    
    
    @IBAction func answerOneAction(_ sender: UIButton) {
        chooseAnswer(button: sender)
    }
    
    @IBAction func answerTwoAction(_ sender: UIButton) {
        chooseAnswer(button: sender)

    }
    @IBAction func answerThreeAction(_ sender: UIButton) {
        chooseAnswer(button: sender)

    }
    
    func reloadWebView(urlString: String ){
          let url = URL(string: urlString)!
          let request = URLRequest(url: url)
          self.flagWebView.load(request)
    }
    
    
    func selectQuestion(questions: [Question]) -> Question{
        var selectedQuestion = questions.randomElement()
        if selectedQuestion!.hasBeenQuestion {
            selectQuestion(questions: questions)
        }
        selectedQuestion?.hasBeenQuestion = true
        return selectedQuestion!
    }
    
    func changeButtonTitle(buttons: [UIButton], previousQuestion: Question, questions: [Question]){
        var buttons = buttons
        var questionsWithoutPrevious = questions
        questionsWithoutPrevious.remove(at: previousQuestion.index)
        
        // Get random button
        if let index = buttons.indices.randomElement() {
            // Change button title
            buttons[index].setTitle(previousQuestion.answer, for: .normal)
            // Remove button from list
            buttons.remove(at: index)
        }
        for button in buttons {
            var randomQuestion = questionsWithoutPrevious.randomElement()
            button.setTitle(randomQuestion?.answer, for: .normal)
            questionsWithoutPrevious.remove(at: randomQuestion!.index)
        }
    }
    
    func chooseAnswer(button: UIButton){
        if button.title(for: .normal)! == self.selectedQuestion.answer{
            // WIN POINT
            PlayerDataManager.shared.addPoint()
            count += 1
            reloadUI()
            
        }
        else {
            count += 1
            reloadUI()
            // LOOSE POINTS
        }

    }
    
    func reloadUI(){
        
    }
    

}
