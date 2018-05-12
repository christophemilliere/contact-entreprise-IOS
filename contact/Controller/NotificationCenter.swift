//
//  NotificationCenter.swift
//  contact
//
//  Created by christophe milliere on 12/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

extension AddController {
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.contraintBottom.constant = 0
        }
    }
    @objc func keyboardShow(notification: Notification) {
        if let height  = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            UIView.animate(withDuration: 0.3) {
                self.contraintBottom.constant = height
            }
        }
    }
}
