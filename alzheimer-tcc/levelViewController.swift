//
//  levelViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 04/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

enum Level {
    case easy
    case medium
    case difficult
}

class levelViewController: UIViewController {

    private let identifierLevel = "playGame"

    @IBAction func back_button(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func easyLevel(_ sender: UIButton) {
        self.performSegue(withIdentifier: identifierLevel, sender: Level.easy)
    }

    @IBAction func mediumLevel(_ sender: UIButton) {
        self.performSegue(withIdentifier: identifierLevel, sender: Level.medium)
    }

    @IBAction func difficultLevel(_ sender: UIButton) {
        self.performSegue(withIdentifier: identifierLevel, sender: Level.difficult)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameViewController = segue.destination as? GameViewController, let level = sender as? Level {
            gameViewController.level = level
        }
    }
}

