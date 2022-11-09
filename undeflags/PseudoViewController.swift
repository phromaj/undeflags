//
//  PseudoViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit

class PseudoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameInput.delegate = self
        
    }
    
    @IBAction func goButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Add user data to localstorage and to global game
        let player = Player(username: textField.text!)
        PlayerDataManager.shared.setPlayer(player: player)
        PlayerDataManager.shared.savePlayerData()
        
        // GET USER USE THIS
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
       
        self.view.endEditing(true)
        return false
    }
    
}
