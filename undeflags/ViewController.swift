//
//  ViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func flagsButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "flags") as? FlagsCollectionViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func gameButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pseudo") as? PseudoViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

