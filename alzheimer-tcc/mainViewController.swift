//
//  ViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 03/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit
import RealmSwift

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50));
        let gradient = CAGradientLayer();
        
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0);
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0);
        gradient.frame = view.bounds;
        gradient.colors = [UIColor.init(red: 150, green: 201, blue: 61, alpha: 0.8), UIColor.init(red: 0, green: 176, blue: 155, alpha: 0.8)];
        
        view.layer.insertSublayer(gradient, at: 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

