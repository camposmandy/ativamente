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
    private var gameSelected: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        games =  GamesManager.shared.getAllGames
//
//        let realm = try! Realm()
//
//        for game in games {
//            realm.delete(game)
//        }

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
        let touchArea = (sender as AnyObject).convert(CGPoint.zero, to: allGames_collectionView)
        if let index = allGames_collectionView.indexPathForItem(at: touchArea)?.row {
            gameSelected = games[index]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let GameViewController = segue.destination as! GameViewController
        GameViewController.game = gameSelected
    }
}
