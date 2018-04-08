//
//  createGameViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 24/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class createGameViewController: UIViewController {
    
    private var _numberCards: Int = 2

    @IBOutlet weak var numberCards_button: ACButton!
    
    @IBAction func plusCards_button(_ sender: Any) {
        if _numberCards < 6 {
            _numberCards += 1
            numberCards_button.setTitle("\(_numberCards)", for: .normal)
        }
    }
    
    @IBAction func lessCards_button(_ sender: Any) {
        if _numberCards > 2  {
            _numberCards -= 1
            numberCards_button.setTitle("\(_numberCards)", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let addedInfosVC = segue.destination as? addedInfosViewController {
            addedInfosVC.totalCards = _numberCards
        }
    }
}
