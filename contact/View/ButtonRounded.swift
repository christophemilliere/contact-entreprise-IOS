//
//  ButtonRounded.swift
//  contact
//
//  Created by christophe milliere on 08/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class ButtonRounded: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkGray.cgColor
        tintColor = UIColor.black
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

}
