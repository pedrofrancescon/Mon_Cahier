//
//  ImageCellModel.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 03/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class ImageCellModel: ContentModel {
    
    var type: ContentType { return .image }
    
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
}
