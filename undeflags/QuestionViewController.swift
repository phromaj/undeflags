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
        print(player ?? "optional")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
