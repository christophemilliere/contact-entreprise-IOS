//
//  AddController.swift
//  contact
//
//  Created by christophe milliere on 08/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit
import CoreData

class AddController: UIViewController {
    
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var picture: ImageRounded!
    @IBOutlet weak var addEntreprise: UIButton!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var addPersonal: ButtonRounded!
    @IBOutlet weak var contraintBottom: NSLayoutConstraint!
    @IBOutlet weak var widthConstant: NSLayoutConstraint!
    
    var companies = [Company]()
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImagePicker()
        setupPicker()
        fetchCompanies()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        widthConstant.constant = view.frame.width
        scroll.contentSize = CGSize(width: widthConstant.constant, height: scroll.frame.height)
    }
    
    func fetchCompanies(){
        let request: NSFetchRequest<Company> = Company.fetchRequest()
        let tri = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [tri]
        do {
            companies =  (try context?.fetch(request))!
            pickerView.reloadAllComponents()
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addEntrepriseAction(_ sender: Any) {
        let alerte = UIAlertController(title: "Votre entreprise n'est pas dans la liste", message: "Ajouter", preferredStyle: .alert)
        
        let add = UIAlertAction(title: "OK", style: .default) { (act) in
            let textField = alerte.textFields![0] as UITextField
            if let text = textField.text, text != "" {
                let newCompany = Company(context: context!)
                newCompany.name = text
                appDelegate?.saveContext()
                self.fetchCompanies()
            }
        }
        alerte.addTextField { (tf) in
            tf.placeholder = "Nom de l'entreprise"
        }
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alerte.addAction(add)
        alerte.addAction(cancel)
        
        self.present(alerte, animated: true, completion: nil)
    }
    
    @IBAction func addPersonalAction(_ sender: Any) {
    }
    

}
