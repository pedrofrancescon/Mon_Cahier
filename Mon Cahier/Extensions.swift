//
//  Extensions.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 27/100
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
}
