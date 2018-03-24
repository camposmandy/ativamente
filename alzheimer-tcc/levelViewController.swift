//
//  levelViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 04/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class levelViewController: UIViewController {
    
    
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
    
    
}

