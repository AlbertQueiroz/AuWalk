//
//  StepsToCoinsView.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StepsToCoinsView: UIView {

    lazy var stepsIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "IconSteps"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit

        return icon
    }()
    
    lazy var stepsLabel: UILabel = {
        var label = UILabel()
        label.text = "Default Text"
        label.textColor = .greenLabel
        
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var coinsIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "stepCoin"))
        icon.tintColor = .brownCoin
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit

        return icon
    }()
    
    lazy var coinsLabel: UILabel = {
        var label = UILabel()
        label.text = "Default Text"
        label.textColor = .greenLabel
        
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var arrowIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "arrow"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit

        return icon
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(daySteps: Int, multiplier: Int){
        self.init()
        self.configureDaySteps(daySteps: daySteps, multiplier: multiplier)
    }
    
    func configureDaySteps(daySteps: Int, multiplier: Int){
        stepsLabel.text = String(daySteps)
        coinsLabel.text = String(daySteps*multiplier)
    }
    
    func setupViews() {
        self.addSubview(arrowIcon)
        self.addSubview(coinsIcon)
        self.addSubview(coinsLabel)
        self.addSubview(stepsLabel)
        self.addSubview(stepsIcon)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            arrowIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            coinsIcon.leadingAnchor.constraint(equalTo: arrowIcon.trailingAnchor, constant: 16),
            coinsIcon.centerYAnchor.constraint(equalTo: arrowIcon.centerYAnchor),
            
            
            coinsLabel.leadingAnchor.constraint(equalTo: coinsIcon.trailingAnchor, constant: 8),
            coinsLabel.centerYAnchor.constraint(equalTo: arrowIcon.centerYAnchor),
            
            stepsLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor, constant: -16),
            stepsLabel.centerYAnchor.constraint(equalTo: arrowIcon.centerYAnchor),
            
            stepsIcon.trailingAnchor.constraint(equalTo: stepsLabel.leadingAnchor
                , constant: -8),
            stepsIcon.centerYAnchor.constraint(equalTo: arrowIcon.centerYAnchor),
            stepsIcon.heightAnchor.constraint(equalTo: stepsIcon.heightAnchor)
        ])
    }
}
