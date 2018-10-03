//
//  ImageCell.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell, ContentCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var model: ImageCellModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         selectionStyle = .none
        
    }
    
    func configure(withModel cellModel: ContentModel) {
        guard let model = cellModel as? ImageCellModel else {
            print("Unable to cast model as ImageCellModel: \(cellModel)")
            return
        }
        
        self.model = model
        
        configureUI()
        
    }
    
    private func configureUI() {
        
        imgView.image = model.image
        
    }

}
