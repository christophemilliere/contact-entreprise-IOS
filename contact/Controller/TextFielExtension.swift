//
//  TextFielExtension.swift
//  contact
//
//  Created by christophe milliere on 12/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

extension AddController: UITextFieldDelegate {
    
    func setupTextField() {
        firstname.delegate = self
        lastname.delegate = self
        phone.delegate = self
        email.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    
}
