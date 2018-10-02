//
//  FolderVC.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class FolderVC: ItemVC {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [ItemVC]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        let rightBarBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(clicked))
        
        navigationItem.setRightBarButton(rightBarBtn, animated: false)
    }


    init(named name: String) {
        self.items = []
        super.init(ofType: .folder, named: name)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    @objc func clicked() {
        
        let alert = UIAlertController(title: "Nova Pasta", message: "O nome da pasta não pode já ter sido usado", preferredStyle: UIAlertController.Style.alert)
        
        let textFieldAction = UIAlertAction(title: "Criar Pasta", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            
            guard let name = textField.text else { return }
            
            if name == "" {
                let nameAlert = UIAlertController(title: "Impossível criar pasta", message: "O nome da pasta não pode ser em branco", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                nameAlert.addAction(okAction)
                
                self.present(nameAlert, animated: true, completion: nil)
                
                return
            }
            
            let newFolder = FolderVC(named: name)
            
            self.items.append(newFolder)
            
            self.updateTableView()
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Digite o nome"
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(textFieldAction)
        alert.addAction(cancelAction)
        
        alert.view.tintColor = UIColor(color: .mainBlue)
        
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

        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        }
        
        cell?.nameLabel.text = items[indexPath.row].name
        cell?.cellType = items[indexPath.row].type
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if items[indexPath.row].type == .folder {
            guard let parent = parent as? MainNavigationController else { return }
            
            parent.pushViewController(items[indexPath.row], animated: true)
        }
        
    }
    
}
