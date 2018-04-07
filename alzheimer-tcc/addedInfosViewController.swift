//
//  addedInfosViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 24/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class addedInfosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var pictureOptionals: UIImagePickerController = UIImagePickerController()
    private var touchToSelectPicture: UITapGestureRecognizer = UITapGestureRecognizer();

    @IBOutlet weak var pictureGame_image: UIImageView!
    @IBOutlet weak var selectPicture_button: ACButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        touchToSelectPicture = UITapGestureRecognizer(target: self, action: #selector(addedInfosViewController.displayOptionalsPicture(_:)))
        self.selectPicture_button.addGestureRecognizer(touchToSelectPicture)
        
        pictureOptionals.delegate = self
        pictureOptionals.allowsEditing = false
        
        pictureGame_image.layer.cornerRadius = 7
        pictureGame_image.layer.masksToBounds = true
        pictureGame_image.layer.borderColor = UIColor.white.cgColor
        pictureGame_image.layer.borderWidth = 1.0
    }

    // added image selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let auxImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let pngImage = UIImagePNGRepresentation(auxImage)
        
        self.pictureGame_image.image = UIImage(data: pngImage!)
        self.dismiss(animated: true, completion: nil)
    }

    @objc func displayOptionalsPicture (_ recognizer: UITapGestureRecognizer){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: { (ACTION) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        let camera = UIAlertAction(title: "Tirar foto", style: .default, handler: { (ACTION) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.pictureOptionals.sourceType = .camera
                self.pictureOptionals.allowsEditing = true
                self.present(self.pictureOptionals, animated: true, completion: nil)
            }
        })
        let library = UIAlertAction(title: "Escolher foto", style: .default, handler: { (ACTION) -> Void in
            self.pictureOptionals.sourceType = .photoLibrary
            self.pictureOptionals.allowsEditing = true
            self.present(self.pictureOptionals, animated: true, completion: nil)
        })
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(library)
        
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
}
