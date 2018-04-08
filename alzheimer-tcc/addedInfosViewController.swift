//
//  addedInfosViewController.swift
//  alzheimer-tcc
//
//  Created by Amanda Campos on 24/03/2018.
//  Copyright © 2018 Amanda Campos. All rights reserved.
//

import UIKit

class addedInfosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
UICollectionViewDelegate, UICollectionViewDataSource {

    private var _pictureOptionals: UIImagePickerController = UIImagePickerController()
    private var _touchToSelectPicture: UITapGestureRecognizer = UITapGestureRecognizer()

    public  var totalCards: Int = 0
    public  var cadsRegistered: Array<NSMutableDictionary> = []

    @IBOutlet weak var addElement_button: ACButton!
    @IBOutlet weak var cardName_textField: ACTextField!
    @IBOutlet weak var pictureGame_image: UIImageView!
    @IBOutlet weak var selectPicture_button: ACButton!
    @IBOutlet weak var registeredSaved: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _touchToSelectPicture = UITapGestureRecognizer(target: self, action: #selector(addedInfosViewController.displayOptionalsPicture(_:)))
        self.selectPicture_button.addGestureRecognizer(_touchToSelectPicture)
        
        _pictureOptionals.delegate = self
        _pictureOptionals.allowsEditing = false
        
        pictureGame_image.layer.cornerRadius = 7
        pictureGame_image.layer.masksToBounds = true
        pictureGame_image.layer.borderColor = UIColor.white.cgColor
        pictureGame_image.layer.borderWidth = 1.0
        
        self.registeredSaved.reloadSections(IndexSet(integer: 0))
    }

    // added image selected
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let auxImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let pngImage = UIImagePNGRepresentation(auxImage)
        
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
    
    // Collection View functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cadsRegistered.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "registeredCardCV", for: indexPath) as! addedInfosCollectionViewCell
        
        cell.displayContent(numberCard: "\(self.cadsRegistered.count)")

        return cell
    }

    // buttons actions
    @IBAction func removeElement(_ sender: Any) {
        if self.cadsRegistered.count > 0 {
            self.cadsRegistered.removeLast()
        }
        if self.cadsRegistered.count != totalCards {
            addElement_button.setTitle("ADICIONAR", for: .normal)
        }
    }

    @IBAction func addElement(_ sender: Any) {
        if addElement_button.currentTitle != "PRÓXIMO PASSO" {
            let element: NSMutableDictionary = NSMutableDictionary()
            
            if (self.cardName_textField != nil) && (self.cardName_textField.text != nil) {
                element.setValue(self.cardName_textField.text, forKey: "name")
            }
            if (self.pictureGame_image != nil) && (self.pictureGame_image.image != nil) {
                element.setValue(self.pictureGame_image.image, forKey: "image")
            }
            
            self.cadsRegistered.append(element)
            self.registeredSaved.reloadSections(IndexSet(integer: 0))

            if self.cadsRegistered.count == totalCards {
                addElement_button.setTitle("PRÓXIMO PASSO", for: .normal)
            }
        }
    }
}
