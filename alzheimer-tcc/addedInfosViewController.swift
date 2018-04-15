//
//  addedInfosViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 24/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class addedInfosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var _pictureOptionals: UIImagePickerController = UIImagePickerController()
    private var _touchToSelectPicture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    public var cardsRegistered: [Card] = []
    public var totalCards: Int = 0

    @IBOutlet weak var cardName_textField: ACTextField!
    @IBOutlet weak var pictureGame_image: UIImageView!
    @IBOutlet weak var selectPicture_button: ACButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _touchToSelectPicture = UITapGestureRecognizer(target: self, action: #selector(addedInfosViewController.displayOptionalsPicture(_:)))
        self.selectPicture_button.addGestureRecognizer(_touchToSelectPicture)
        
        _pictureOptionals.delegate = self
        _pictureOptionals.allowsEditing = false
        
        pictureGame_image.layer.cornerRadius = 125/2
        pictureGame_image.layer.masksToBounds = true
        pictureGame_image.layer.borderColor = UIColor.white.cgColor
        pictureGame_image.layer.borderWidth = 1.0
    }

    // added image selected
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let auxImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let pngImage = UIImagePNGRepresentation(auxImage)
        
        self.pictureGame_image.contentMode = .scaleAspectFit
        self.pictureGame_image.image = UIImage(data: pngImage!)
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func displayOptionalsPicture (_ recognizer: UITapGestureRecognizer){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: { (ACTION) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        let camera = UIAlertAction(title: "Tirar foto", style: .default, handler: { (ACTION) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self._pictureOptionals.sourceType = .camera
                self._pictureOptionals.allowsEditing = true
                self.present(self._pictureOptionals, animated: true, completion: nil)
            }
        })
        let library = UIAlertAction(title: "Escolher foto", style: .default, handler: { (ACTION) -> Void in
            self._pictureOptionals.sourceType = .photoLibrary
            self._pictureOptionals.allowsEditing = true
            self.present(self._pictureOptionals, animated: true, completion: nil)
        })
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(library)
        
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func back_button(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    
    
    @IBAction func backHome_button(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let CardsRegisteredViewController = segue.destination as? CardsRegisteredViewController {

            if let imageCard = pictureGame_image.image,
               let imageData = UIImageJPEGRepresentation(imageCard, 1.0),
               let nameCard  = cardName_textField.text {

                let cardItem = Card()
                cardItem.title = nameCard
                cardItem.image = imageData
                
                cardsRegistered.append(cardItem)
            
                CardsRegisteredViewController.cardsRegistered = cardsRegistered
            }

            CardsRegisteredViewController.numberCardsWants = totalCards
        }
    }
}
