//
//  ModalViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var modalView = ModalView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 64, width: UIScreen.main.bounds.width, height: 250))
    
    var handleArea: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = modalView
        self.modalView.tableView.delegate = self
        self.modalView.tableView.dataSource = self
        setupHandleArea()
    }
    
    func setupHandleArea() {
        self.modalView.addSubview(self.handleArea)
        self.handleArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.handleArea.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.handleArea.heightAnchor.constraint(equalToConstant: 80),
            self.handleArea.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.handleArea.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
