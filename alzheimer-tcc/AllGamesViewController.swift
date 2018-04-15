//
//  AllGames.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 14/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class AllGamesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let games =  GamesManager.shared.getAllGames
        print(games.count, "jogos criados")

    }
}
