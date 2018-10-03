//
//  TextCellModel.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 03/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class TextCellModel: ContentModel {
    
    var type: ContentType { return .text }
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
}
