//
//  MainNavigationController.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        let navigationTitleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(color: .mainBlue) as Any
        ]
        
        navigationBar.titleTextAttributes = navigationTitleAttributes
        navigationBar.tintColor = UIColor(color: .mainBlue)
        
        let mainVC = FolderVC(named: "Mon Cahier")
        setViewControllers([mainVC], animated: false)
        
        // Dismiss keyboard
        /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -*/
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        navigationBar.addGestureRecognizer(tap)
        
    }
    
    init() {
        
        super.init(nibName: "MainNavigationController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        topViewController?.view.endEditing(true)
    }

}
