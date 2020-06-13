//
//  ModalViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var modalView = ModalView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 90, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = modalView
        self.modalView.tableView.delegate = self
        self.modalView.tableView.dataSource = self
    }
    

}


extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = Item(name: "Mamadeira", description: "Uma dose de leite letal", price: 400, category: "1")
        let cell = ItemCell(of: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

