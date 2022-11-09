//
//  FlagsCollectionViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit
import WebKit

private let reuseIdentifier = "Cell"

class FlagsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let svg = DataManager.shared.svgLinks

    override func viewDidAppear(_ animated: Bool) {
        self.collectionView!.register(ItemFlagCollectionViewCell.self, forCellWithReuseIdentifier: "flagCell")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.svg!.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flagCell", for: indexPath) as! ItemFlagCollectionViewCell
        
        cell.backgroundColor = .systemRed
        
        cell.configure(with: svg![indexPath.row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailFlag") as? DetailFlagViewController {
            
            vc.linkBrowser = self.svg![indexPath.row]
            
            //Afficher une modal
            self.present(vc, animated: true, completion: nil)

        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let xPadding = 5
        let spacing = 1
        let rightPadding = 5
        let heightCell = 120
        let numberMaxCellHorizontal = 2
        
        let width = (CGFloat(UIScreen.main.bounds.size.width) - CGFloat(xPadding + spacing + rightPadding)) / CGFloat(numberMaxCellHorizontal)
        let height = CGFloat(heightCell)

        return CGSize(width: width, height: height)
    }


}
