//
//  addedInfosCollectionViewCell.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 07/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class addedInfosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberCardRegistered_label: UILabel!
    
    public func displayContent (numberCard: String) {
        self.numberCardRegistered_label.text = numberCard
    }
}
