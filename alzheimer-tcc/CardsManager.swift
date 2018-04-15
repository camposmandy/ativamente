//
//  CardsManager.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 14/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class CardsManager {
    var realm : Realm!
    
    var getAllCards: Results<Card> {
        get {
            return realm.objects(Card.self)
        }
    }
}
