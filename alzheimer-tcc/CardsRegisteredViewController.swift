//
//  CardsRegisteredViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 08/04/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class CardsRegisteredViewController: UIViewController, UICollectionViewDataSource {

    private let reuseIdentifierCell = "cardRegistered"
    private let nextStep = "PRÓXIMO PASSO"
    private let lastStep = "ADICIONAR"
    private let identifierAddedInfos = "AddedCard"
    private let identifierSaveGame = "SaveGame"

    public var cardsRegistered: [Card] = []
    public var numberCardsWants: Int = 0

    @IBOutlet weak var actionFlex_button: ACButton!
    @IBOutlet weak var cardsRegistered_CollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if cardsRegistered.count == numberCardsWants {
            actionFlex_button.setTitle(nextStep, for: .normal)
        }
    }

    // Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsRegistered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCell, for: indexPath) as? CardRegisteredCollectionViewCell
        
        if let imageData = cardsRegistered[indexPath.row].image, let imageCard = UIImage(data: imageData) {
            cell?.displayContent(
                nameCard: cardsRegistered[indexPath.row].title,
                imageCard: imageCard
            )
        }

        return cell!
    }

    @IBAction func destinationView(_ sender: Any) {
        if actionFlex_button.currentTitle != nextStep {
            self.performSegue(withIdentifier: identifierAddedInfos, sender: self)
        } else {
            self.performSegue(withIdentifier: identifierSaveGame, sender: self)
        }
    }

    @IBAction func back_button(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func backHome_button(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func teste(_ sender: Any) {
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.cardsRegistered_CollectionView)
        let indexCard = self.cardsRegistered_CollectionView.indexPathForItem(at: buttonPosition)?.row

        cardsRegistered.remove(at: indexCard!)

        if actionFlex_button.currentTitle == nextStep {
            actionFlex_button.setTitle(lastStep, for: .normal)
        }

        self.cardsRegistered_CollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierAddedInfos {
            let AddedInfosViewController = segue.destination as! addedInfosViewController

            for card in cardsRegistered {
                AddedInfosViewController.cardsRegistered.append(card)
            }
            
            AddedInfosViewController.totalCards = numberCardsWants
        } else if segue.identifier == identifierSaveGame {
            let SaveNewGameViewController = segue.destination as! SaveNewGameViewController
            SaveNewGameViewController.gameCards = cardsRegistered
        }
    }
    
}
