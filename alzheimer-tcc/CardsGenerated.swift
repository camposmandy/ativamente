//
//  CardsGenerated.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 01/05/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

class CardsGenerated {
    private var musicaDeFundo: AVAudioPlayer?
    private let cardsDefault: [Card] = [
        Card(title: "Lampada", image: #imageLiteral(resourceName: "lamp"), idCard: 1),
        Card(title: "Chave", image: #imageLiteral(resourceName: "key"), idCard: 2),
        Card(title: "Relógio", image: #imageLiteral(resourceName: "clock"), idCard: 3),
        Card(title: "Ônibus", image: #imageLiteral(resourceName: "bus"), idCard: 4),
        Card(title: "Camiseta", image: #imageLiteral(resourceName: "tshirt"), idCard: 5),
        Card(title: "Família", image: #imageLiteral(resourceName: "family"), idCard: 6),
        Card(title: "Calculadora", image: #imageLiteral(resourceName: "calculator"), idCard: 7),
        Card(title: "Panela", image: #imageLiteral(resourceName: "pan"), idCard: 8),
        Card(title: "Carro", image: #imageLiteral(resourceName: "car"), idCard: 9),
        Card(title: "Avião", image: #imageLiteral(resourceName: "airplane"), idCard: 10),
        Card(title: "Presente", image: #imageLiteral(resourceName: "gift"), idCard: 11),
        Card(title: "Cama", image: #imageLiteral(resourceName: "bed"), idCard: 12),
        Card(title: "Cachorro", image:  #imageLiteral(resourceName: "dog"), idCard: 13),
        Card(title: "Árvore", image: #imageLiteral(resourceName: "tree"), idCard: 15),
        Card(title: "Enfermeiro", image: #imageLiteral(resourceName: "nurse"), idCard: 16),
        Card(title: "Táxi", image: #imageLiteral(resourceName: "taxi"), idCard: 17),
        Card(title: "Martelo", image: #imageLiteral(resourceName: "hammer"), idCard: 18),
        Card(title: "Injeção", image: #imageLiteral(resourceName: "syring"), idCard: 20),
        Card(title: "Bebê", image: #imageLiteral(resourceName: "baby"), idCard: 21),
        Card(title: "Violão", image: #imageLiteral(resourceName: "guitar"), idCard: 23),
        Card(title: "Sorvete", image: #imageLiteral(resourceName: "ice-cream"), idCard: 24),
        Card(title: "Peixe", image: #imageLiteral(resourceName: "fish"), idCard: 25),
        Card(title: "Policial", image: #imageLiteral(resourceName: "police-car"), idCard: 26)
    ]

    init() {
        
    }
    
    func randomCards(totalCards: Int) -> Game {
        var cardsRandom = cardsDefault
        let game = Game()

        for i in 0..<cardsRandom.count {
            let j = Int(arc4random_uniform(UInt32(cardsDefault.count)))
            if j != i {
                cardsRandom.swapAt(i, j)
            }
        }
        
        for i in 0..<totalCards {
            game.cards.append(cardsRandom[i])
            game.cards.append(cardsRandom[i])
        }

        return game
    }
    
    func tocarmusica(music: String) {
        let url = Bundle.main.url(forResource: music, withExtension: "mp3")!
        
        do {
            musicaDeFundo = try AVAudioPlayer(contentsOf: url)
            guard let player = musicaDeFundo else { return }
            player.prepareToPlay()
            player.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                player.stop()
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
}
