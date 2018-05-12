//
//  HomeCell.swift
//  contact
//
//  Created by christophe milliere on 12/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var pictureProfil: ImageRounded!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var personn: Personn!
    
    func setupCell(personn: Personn){
        
        self.personn = personn
        
        pictureProfil.image = self.personn.photo as? UIImage
        var fullName = ""
        
        if let firstname = self.personn.firstname {
            fullName += firstname + " "
        }
        
        if let lastname = self.personn.lastname {
            fullName += lastname + " "
        }
        
        fullname.text = fullName
        let phoneString = String(self.personn.phone)
        phone.text = phoneString
        
        let emailString = self.personn.email ?? ""
        email.text = emailString
        
        
        
    }

}
