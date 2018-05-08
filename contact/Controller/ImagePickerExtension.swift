//
//  ImagePickerExtension.swift
//  contact
//
//  Created by christophe milliere on 08/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

extension AddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func setupImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker?.delegate = self
        picture.isUserInteractionEnabled = true
        picture.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickPhoto)))
    }
    
    @objc func clickPhoto(){
        guard imagePicker != nil else { return }
        let alerte = UIAlertController(title: "Prendre une photo", message: "Choissiez votre media", preferredStyle: .alert)
        let device = UIAlertAction(title: "Appareil Photo", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let library = UIAlertAction(title: "Librairie", style: .default) { (_) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Annuler", style: .destructive, handler: nil)
        
        alerte.addAction(device)
        alerte.addAction(library)
        alerte.addAction(cancel)
        self.present(alerte, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        if let editing = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editing
        }else if let original = info[UIImagePickerControllerOriginalImage] as? UIImage{
            image = original
        }
        picture.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
