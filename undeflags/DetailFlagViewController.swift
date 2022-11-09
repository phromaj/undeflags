//
//  DetailFlagViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit
import WebKit

class DetailFlagViewController: UIViewController {

    @IBOutlet weak var imgWKWebView: WKWebView!
    
    var linkBrowser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.reloadWebView(text: self.linkBrowser)
    }
    
    func reloadWebView(text: String) {
        let url = URL(string: text)!
        let request = URLRequest(url: url)
        self.imgWKWebView?.load(request)
    }

}
