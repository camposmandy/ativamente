//
//  addedInfosCollectionViewCell.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 07/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class CardRegisteredCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameCardRegistered_label: UILabel!
    @IBOutlet weak var imageCardRegistered_image: UIImageView!
    
    public func displayContent (nameCard: String, imageCard: UIImage) {
        self.nameCardRegistered_label.text = nameCard
        self.imageCardRegistered_image.image = imageCard
    }
}
