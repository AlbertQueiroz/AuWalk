//
//  ModaView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalView: UIView {

    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.backgroundColor = .red
        return segmentedControl
    }()
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .blue
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupModal()
        setupSegmentedControl()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModal() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
    }
    
    func setupSegmentedControl() {
        self.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.segmentedControl.topAnchor.constraint(equalTo: self.topAnchor),
            self.segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.segmentedControl.widthAnchor.constraint(equalToConstant: 300),
            self.segmentedControl.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupTableView() {
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
}
