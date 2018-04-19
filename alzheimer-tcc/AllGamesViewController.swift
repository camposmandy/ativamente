//
//  AllGames.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 14/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class AllGamesViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var allGames_collectionView: UICollectionView!
    private var games: Results<Game>!

    override func viewDidLoad() {
        super.viewDidLoad()

        games =  GamesManager.shared.getAllGames
        print("total jogos: ", games.count)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameRegistered", for: indexPath) as? GameRegisteredCollectionViewCell
        
        let currentGame = games[indexPath.row]
        cell?.displayContent(title: currentGame.title)
        
        return cell!
    }

    
    @IBAction func displayGame(_ sender: Any) {
        
    }
}
