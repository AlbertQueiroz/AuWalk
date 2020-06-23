//
//  StatisticsListView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 23/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StatisticsListView: UICollectionViewCell {
    
    let stepsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Passos"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let stepsCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 100
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 50
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupStepsCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStepsCard() {
        self.addSubview(stepsCard)
        self.addSubview(stepsLabel)
        NSLayoutConstraint.activate([
            self.stepsCard.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stepsCard.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepsCard.heightAnchor.constraint(equalToConstant: 200),
            self.stepsCard.widthAnchor.constraint(equalToConstant: 200),
            
            self.stepsLabel.centerXAnchor.constraint(equalTo: self.stepsCard.centerXAnchor),
            self.stepsLabel.bottomAnchor.constraint(equalTo: self.stepsCard.topAnchor, constant: -8),
            self.stepsLabel.heightAnchor.constraint(equalToConstant: 44),
            self.stepsLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}
