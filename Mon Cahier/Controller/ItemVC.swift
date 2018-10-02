//
//  ItemVC.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class ItemVC: UIViewController {
    
    var name: String

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = name
    }


    init(named name: String) {
        self.name = name
        
        super.init(nibName: nil, bundle: nil)
        //super.init(nibName: "ItemVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
