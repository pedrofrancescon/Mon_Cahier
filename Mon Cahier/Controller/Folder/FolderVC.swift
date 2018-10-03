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
    @IBOutlet weak var newDocButton: UIButton!
    
    var items: [ItemVC]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        let rightBarBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(clicked))
        
        navigationItem.setRightBarButton(rightBarBtn, animated: false)
        
        // New Document Button
        /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -*/
        
        newDocButton.backgroundColor = UIColor(color: .mainBlue)
        newDocButton.layer.cornerRadius = newDocButton.frame.height/2.0
        
        let btnAttributes = [
            NSAttributedString.Key.font: UIFont(name: "FontAwesome5FreeSolid", size: 25.0) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any
        ]
        
        let btnString = NSMutableAttributedString(string: "\u{f067}", attributes: btnAttributes)
        
        newDocButton.setAttributedTitle(btnString, for: .normal)
        newDocButton.addShadow()
        
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
            textField.autocapitalizationType = UITextAutocapitalizationType.words
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(textFieldAction)
        alert.addAction(cancelAction)
        
        alert.view.tintColor = UIColor(color: .mainBlue)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapNewDocBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Novo Documento", message: "O nome do documento não pode já ter sido usado", preferredStyle: UIAlertController.Style.alert)
        
        let textFieldAction = UIAlertAction(title: "Pronto", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            
            guard let name = textField.text else { return }
            
            if name == "" {
                let nameAlert = UIAlertController(title: "Impossível criar documento", message: "O nome do documento não pode ser em branco", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                nameAlert.addAction(okAction)
                
                self.present(nameAlert, animated: true, completion: nil)
                
                return
            }
            
            let newFolder = DocumentVC(named: name)
            
            self.items.append(newFolder)
            
            self.updateTableView()
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Digite o nome"
            textField.autocapitalizationType = UITextAutocapitalizationType.words
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "itemCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell
        }
        
        cell?.nameLabel.text = items[indexPath.row].name
        cell?.cellType = items[indexPath.row].type
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let parent = parent as? MainNavigationController else { return }
        
        parent.pushViewController(items[indexPath.row], animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            let alert = UIAlertController(title: "Tem certeza?", message: "Esta ação é permanente e não pode ser desfeita.", preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let yesAction = UIAlertAction(title: "Sim", style: .destructive) { (alertAction) in
                self.items.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        delete.backgroundColor = UIColor.red
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            
            let vc = UIActivityViewController(activityItems: [], applicationActivities: [])
            self.present(vc, animated: true)
            
        }
        share.backgroundColor = UIColor(color: .mainBlue)
        
        return [delete, share]
        
    }
    
}
