//
//  PetViewController.swift
//  AuWalk
//
//  Created by Albert Rayneer on 09/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {

    let topBar: TopBar = {
        let tb = TopBar()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(topBar)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            topBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            topBar.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
}
