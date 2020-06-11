//
//  ModaView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ModalView: UIView {
    
    var handleArea: UIView = {
        let view = UIView()
        return view
    }()

    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: nil, at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: nil, at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: nil, at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: nil, at: 3, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupModal()
        setupHandleArea()
        setupSegmentedControl()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModal() {
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 16
    }
    
    func setupHandleArea() {
        self.addSubview(self.handleArea)
        self.handleArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.handleArea.topAnchor.constraint(equalTo: self.topAnchor),
            self.handleArea.heightAnchor.constraint(equalToConstant: 90),
            self.handleArea.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.handleArea.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupSegmentedControl() {
        if #available(iOS 13.0, *) {
            self.segmentedControl.selectedSegmentTintColor = .white
        } else {
            self.segmentedControl.tintColor = .white
        }
        
        
        segmentedControl.alpha = 0
        self.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.segmentedControl.topAnchor.constraint(equalTo: self.topAnchor),
            self.segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.segmentedControl.widthAnchor.constraint(equalToConstant: 260),
            self.segmentedControl.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func setupTableView() {
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
}
