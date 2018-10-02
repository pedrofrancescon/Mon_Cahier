//
//  ItemVC.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

enum ItemType {
    case document
    case folder
}

class ItemVC: UIViewController {
    
    var name: String
    var type: ItemType

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = name
    }
    
    init(ofType type: ItemType, named name: String) {
        self.name = name
        self.type = type
        super.init(nibName: nil, bundle: nil)
        //super.init(nibName: "ItemVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
