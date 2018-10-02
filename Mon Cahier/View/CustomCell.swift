//
//  ResultsCell.swift
//  Carp
//
//  Created by Pedro Francescon Cittolin on 31/08/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var cellType: ItemType = .folder
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconLabel.font = UIFont(name: "FontAwesome5FreeRegular", size: 25)
        iconLabel.textColor = UIColor(color: .mainBlue)
        
    }
    
    override func layoutSubviews() {
        switch cellType {
        case .document:
            iconLabel.text = "\u{f15b}"
            break
        case .folder:
            iconLabel.text = "\u{f07b}"
            break
        }
        
        super.layoutSubviews()
    }
    
}
