//
//  PickerViewExtension.swift
//  contact
//
//  Created by christophe milliere on 08/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//
import UIKit

extension AddController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setupPicker(){
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companies[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let name  = companies[row].name ?? ""
        print("ligne choisie \(name)")
    }
}
