//
//  DocumentVC.swift
//  Mon Cahier
//
//  Created by Pedro Francescon Cittolin on 02/10/18.
//  Copyright © 2018 Pedro Francescon Cittolin. All rights reserved.
//

import UIKit

class DocumentVC: ItemVC {
    
    var contents: [ContentModel]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 10
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        contents.append(TextCellModel(text: "Aqui vai algum textinho legal"))
        contents.append(ImageCellModel(image: UIImage(named: "99.jpeg")!))
        contents.append(TextCellModel(text: "Ai aqui é um exemplo de um texto um pouco mais grande para testar se as células da Table View estão ajustando o seu tamanho automaticamente"))
    }


    init(named name: String) {
        self.contents = []
        super.init(ofType: .document, named: name)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

enum ContentType: String {
    case image = "ImageCell"
    case text = "TextCell"
}

protocol ContentModel: class {
    var type: ContentType { get }
}

protocol ContentCell: class {
    func configure(withModel cellModel: ContentModel)
}


extension DocumentVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = contents[indexPath.row]
        let cellIdentifier = cellModel.type.rawValue
        var customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ContentCell
        
        if customCell == nil {
            tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
            customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ContentCell
        }
        
        customCell?.configure(withModel: cellModel)
        
        return customCell as! UITableViewCell
    }
    
}
