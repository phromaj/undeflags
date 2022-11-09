//
//  ItemFlagCollectionViewCell.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit
import WebKit

class ItemFlagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgItemWebView: WKWebView!
    
    func configure(with url: String) {
        DispatchQueue.main.async {
            let url = URL(string: url)!
            let request = URLRequest(url: url)
            self.imgItemWebView?.load(request)
        }
    }
    
}
