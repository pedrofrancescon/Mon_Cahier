//
//  TextCell.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, ContentCell {

    @IBOutlet weak var textView: ContentTextView!
    
    var model: TextCellModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        textView.isScrollEnabled = false
    }
    
    func configure(withModel cellModel: ContentModel) {
        guard let model = cellModel as? TextCellModel else {
            print("Unable to cast model as TextCellModel: \(cellModel)")
            return
        }
        
        self.model = model
        
        configureUI()
        
    }
    
    private func configureUI() {
        textView.text = model.text
    }

}
