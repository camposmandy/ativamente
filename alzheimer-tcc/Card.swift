//
//  card.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 08/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import RealmSwift
import Foundation

class Card: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var image: Data? = nil
    @objc dynamic var idCard: String = ""
    
    convenience init(title: String, image: UIImage, idCard: Int) {
        self.init()
        let auxImage = image.convert(toSize:CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale)
        let pngImage = UIImagePNGRepresentation(auxImage)
        
//        let ui = UIImageJPEGRepresentation(image, 1.0)
        self.title = title
        self.idCard = "\(idCard)"
        self.image = pngImage
    }
}
