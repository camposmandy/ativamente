//
//  GameViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 18/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource {

    public var game: Game!
    public var countFounders: Int = 0
    private var cardsGame: [Card] = []
    @IBOutlet weak var game_CollectionView: UICollectionView!
    
    private var count = 0
    private var arrIndexPath = [IndexPath(row: 0, section: 2)]
    private var arrIndexItem = [Int()]
    private let correct_image = #imageLiteral(resourceName: "verified-card")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsGame = shuffleArray(Array(game.cards))
    }

    @IBAction func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayGame", for: indexPath) as? GameSelectedCollectionViewCell

        cell?.labelGame.text = cardsGame[indexPath.row].title
        cell?.labelId.text = cardsGame[indexPath.row].idCard
        
        cell?.imageGame.image = UIImage(data: cardsGame[indexPath.row].image!)
        cell?.imageGame.layer.cornerRadius = 150/2
        cell?.imageGame.layer.masksToBounds = true
        cell?.imageGame.layer.borderColor = UIColor.white.cgColor
        cell?.imageGame.layer.borderWidth = 1.0

        cell?.imageGame.alpha = 0
        cell?.labelGame.alpha = 0
    
        return cell!
    }

    func shuffleArray(_ cards: [Card]) -> [Card] {
        var cardsRandom = cards
        for i in 0..<cardsRandom.count {
            let j = Int(arc4random_uniform(UInt32(cardsRandom.count)))
            if j != i {
                cardsRandom.swapAt(i, j)
            }
        }
        return cardsRandom
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        collectionView.isUserInteractionEnabled = false
        
        arrIndexPath.append(indexPath)
        arrIndexItem.append(indexPath.row)
        count += 1
        
//        for i in arrIndexPath {
            let cell = collectionView.cellForItem(at: indexPath) as? GameSelectedCollectionViewCell
            cell?.imageGame.alpha = 1
            cell?.labelGame.alpha = 1
            cell?.isUserInteractionEnabled = false
        
        if count == 2 {
            // correct items?
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.validCards()
            }
        } else {
            collectionView.isUserInteractionEnabled = true
        }
    }
    
    func validCards() {
        
        if self.cardsGame[(arrIndexItem.first)!].idCard == self.cardsGame[(arrIndexItem.last)!].idCard  {
            countFounders+=2

            if countFounders == cardsGame.count {
                // ganhou jogo
                for i in self.arrIndexPath {
                    let cell = self.game_CollectionView.cellForItem(at: i) as? GameSelectedCollectionViewCell
                    cell?.tag = 100
                    cell?.imageGame.image = correct_image
                    cell?.labelGame.text = "CORRETO"
                }

            } else {
                //encontrou um par
                for i in self.arrIndexPath {
                    let cell = self.game_CollectionView.cellForItem(at: i) as? GameSelectedCollectionViewCell
                    cell?.tag = 100
                    cell?.imageGame.image = correct_image
                    cell?.labelGame.text = "CORRETO"
                }
            }
        } else {
            for i in arrIndexPath {
                let cell = self.game_CollectionView.cellForItem(at: i) as? GameSelectedCollectionViewCell
                cell?.imageGame.alpha = 0
                cell?.labelGame.alpha = 0
                cell?.isUserInteractionEnabled = true
            }
        }
        
        self.arrIndexPath.removeAll()
        self.arrIndexItem.removeAll()
        self.count = 0
        self.game_CollectionView.isUserInteractionEnabled = true
    }
}
