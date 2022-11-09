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
    var selectedQuestion: Question = Question(answer: "", link: "", index: 0, hasBeenQuestion: false)
    var questions: [Question] = []
    var level: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var buttons: [UIButton] = []
        buttons.append(answer1Button)
        buttons.append(answer2Button)
        buttons.append(answer3Button)
        // Set player points to 0
        PlayerDataManager.shared.player?.points = 0
        
        
        for (index, flag) in DataManager.shared.flags!.enumerated() {
            var question: Question = Question(answer: "\(flag.name) \(flag.year)",
                                              link: DataManager.shared.svgLinks![index],
                                              index: index,
                                              hasBeenQuestion: false)
            self.questions.append(question)
        }
        
        // Choose random question
        self.selectedQuestion = selectQuestion(questions: self.questions)
        
        // Update UI
        self.changeButtonTitle(buttons: buttons, previousQuestion: self.selectedQuestion, questions: self.questions)
        self.reloadWebView(urlString: self.selectedQuestion.link)
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
            if let index = questionsWithoutPrevious.indices.randomElement(){
                button.setTitle(questionsWithoutPrevious[index].answer, for: .normal)
                questionsWithoutPrevious.remove(at: index)
            }
            
        }
    }
    
    func chooseAnswer(button: UIButton){
        if button.title(for: .normal)! == self.selectedQuestion.answer{
            print("you wiiin")
            // Add a point to player
            PlayerDataManager.shared.addPoint()
            // Select new question
            loadNextQuestion()
        }
        else {
            print("you looooooose")
            // Select new question
            loadNextQuestion()
            
        }
    }
    
    func loadNextQuestion(){
        self.level += 1
        // End game if we completed level 5
        if(level > 5){
            // Push ending screen
            print("GAME IS WON OOOOOVVERRR")
            print(PlayerDataManager.shared.player?.points)
        }
        // Or keep adding questions
        else {
            // Choose random question
            
            self.selectedQuestion = selectQuestion(questions: self.questions)
            // Reload UI
            reloadUI()
        }
        
    }
    
    func reloadUI(){
        // Update UI
        var buttons: [UIButton] = []
        buttons.append(answer1Button)
        buttons.append(answer2Button)
        buttons.append(answer3Button)
        self.changeButtonTitle(buttons: buttons, previousQuestion: self.selectedQuestion, questions: self.questions)
        self.reloadWebView(urlString: self.selectedQuestion.link)
    }
    

}
