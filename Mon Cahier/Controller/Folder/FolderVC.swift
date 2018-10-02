//
//  FolderVC.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class FolderVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subFolders: [FolderVC]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let rightBarBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(clicked))
        rightBarBtn.tintColor = UIColor(color: .mainBlue)
        
        navigationItem.setRightBarButton(rightBarBtn, animated: false)
        
        navigationItem.title = "Mon Cahier"
        
    }


    init() {
        self.subFolders = []
        super.init(nibName: "FolderVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clicked() {
        
        let alert = UIAlertController(title: "Nova Pasta", message: "O nome da pasta não pode já ter sido usado", preferredStyle: UIAlertController.Style.alert)
        
        let textFieldAction = UIAlertAction(title: "Criar Pasta", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Digite o nome"
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(textFieldAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }

}

extension FolderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subFolders.count == 0 {
            tableView.separatorStyle = .none
            return subFolders.count
        }
        
        tableView.separatorStyle = .singleLine
        
        return subFolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        }
        
        cell?.nameLabel.text = "Documento de teste"
        
        return cell!
    }
    
}
