//
//  FinalViewController.swift
//  undeflags
//
//  Created by Robin LITTIERE on 10/11/2022.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var finaLabelText: UILabel!
    @IBOutlet weak var scoreLabelText: UILabel!
    @IBOutlet weak var commentLabelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        finaLabelText.text = "Bravo \(PlayerDataManager.shared.player!.username) !"
        scoreLabelText.text = "Votre score : \(PlayerDataManager.shared.player!.points)/5"
        switch PlayerDataManager.shared.player!.points {
        case 0:
            commentLabelText.text = "Tu as voté Zemmour ? 🤔"
            break
        case 1:
            commentLabelText.text = "A deux doights d'être homophobe 🤭"
            break
        case 2:
            commentLabelText.text = "Appelle Magloire 😘 "
            break
        case 3:
            commentLabelText.text = "On se retrouve à la gay pride 👀"
            break
        case 4:
            commentLabelText.text = "Questionne toi sur ta sexualité ♥️"
            break
        case 5:
            commentLabelText.text = "Bravo tu es homo ♥️"

            break
        default:
            break
        
        }
      
    }
    

    @IBAction func backToMenu(_ sender: Any) {
        if UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") is ViewController {
                    self.navigationController?.popToRootViewController(animated: true)
                }
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
