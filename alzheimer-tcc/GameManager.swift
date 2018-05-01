//
//  GameManager.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 14/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class GamesManager {
    
    static let shared = GamesManager()
    
    let realm : Realm
    
    init() {
        realm = try! Realm()
    }

    var getAllGames: Results<Game> {
        get {
            return realm.objects(Game.self)
        }
    }
    
    public func findGame(filter: String) -> Results<Game> {
        return realm.objects(Game.self).filter(filter)
    }
}
