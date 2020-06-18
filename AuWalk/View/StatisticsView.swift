//
//  StatisticsView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 18/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StatisticsView: UIView {
    
    var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButton"), for: .normal)
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.setupBackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackButton() {
        self.addSubview(backButton)
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.backButton.heightAnchor.constraint(equalToConstant: 64),
            self.backButton.widthAnchor.constraint(equalToConstant: 64)
            
        ])
    }

}
