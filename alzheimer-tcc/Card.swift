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
}
