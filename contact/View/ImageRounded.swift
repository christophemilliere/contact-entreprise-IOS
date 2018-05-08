//
//  ImageRounded.swift
//  contact
//
//  Created by christophe milliere on 08/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class ImageRounded: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = frame.width / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        image = #imageLiteral(resourceName: "vador")
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
