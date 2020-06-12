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
        let cell = ItemCell()
        cell.itemName.text = "Teste"
        cell.itemDescription.text = "Um grande teste"
        cell.backgroundColor = .clear

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
