//
//  SaveNewGameViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 11/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class SaveNewGameViewController: UIViewController {
    
    @IBOutlet weak var saveGame_button: ACButton!
    @IBOutlet weak var gameName_textField: ACTextField!
    public var gameCards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveGame(_ sender: Any) {
        if let titleGame = gameName_textField.text {
            let game: Game = Game()
            var index: Int = 0

            game.title = titleGame
            for card in gameCards {
                card.idCard = "\(index)"
                game.cards.append(card)
                game.cards.append(card)
                index += 1
            }

            let realm = try! Realm()
            try! realm.write {
                realm.add(game)
            }
        }
    }
}
