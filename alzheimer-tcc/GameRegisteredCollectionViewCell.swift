//
//  GameRegisteredCollectionViewCell.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 15/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class GameRegisteredCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameSelected: ACButton!

    public func displayContent(title: String) {
        gameSelected.setTitle(title, for: .normal)
    }
}
