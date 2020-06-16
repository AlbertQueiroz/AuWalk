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
    
    var items: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.modalView.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = modalView
        self.modalView.tableView.delegate = self
        self.modalView.tableView.dataSource = self
        self.modalView.tableView.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        StoreRepository().read(category: StoreAPI.allItems) { [weak self] (items) in
            self?.items = items
        }
    }

}


extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = ItemCell(of: item)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

