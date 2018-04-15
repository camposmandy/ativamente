//
//  Game.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 14/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import RealmSwift

class Game: Object {
    @objc dynamic var title = ""
    let cards = List<Card>()
}
