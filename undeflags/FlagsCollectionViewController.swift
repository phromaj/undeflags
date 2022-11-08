//
//  FlagsCollectionViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 08/11/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FlagsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .systemBackground
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = .systemRed
        
        return cell
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
