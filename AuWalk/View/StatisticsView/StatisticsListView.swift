//
//  StatisticsListView.swift
//  AuWalk
//
//  Created by Albert Rayneer on 23/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class StatisticsListView: UICollectionViewCell {
    
    let stepsTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Passos"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let stepsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "30000"
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
    
    let coinsTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Moedas da Semana"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2

        return label
    }()
    
    let coinsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "250000"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let coinsCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 60
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 50
        return view
    }()
    
    let sleepTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Horas dormidas"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    let sleepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8h"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let sleepCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 50
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupStepsCard()
        self.setupCoinsCard()
        self.setupSleepCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStepsCard() {
        self.addSubview(stepsCard)
        self.stepsCard.addSubview(stepsLabel)
        self.addSubview(stepsTitleLabel)
        NSLayoutConstraint.activate([
            self.stepsCard.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stepsCard.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepsCard.heightAnchor.constraint(equalToConstant: 200),
            self.stepsCard.widthAnchor.constraint(equalToConstant: 200),
            
            self.stepsTitleLabel.centerXAnchor.constraint(equalTo: self.stepsCard.centerXAnchor),
            self.stepsTitleLabel.bottomAnchor.constraint(equalTo: self.stepsCard.topAnchor, constant: -8),
            self.stepsTitleLabel.heightAnchor.constraint(equalToConstant: 44),
            self.stepsTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            self.stepsLabel.centerXAnchor.constraint(equalTo: self.stepsCard.centerXAnchor),
            self.stepsLabel.centerYAnchor.constraint(equalTo: self.stepsCard.centerYAnchor),
            self.stepsTitleLabel.heightAnchor.constraint(equalToConstant: 44),
            self.stepsTitleLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setupCoinsCard() {
        self.addSubview(coinsCard)
        self.coinsCard.addSubview(coinsLabel)
        self.addSubview(coinsTitleLabel)
        NSLayoutConstraint.activate([
            self.coinsCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.coinsCard.topAnchor.constraint(equalTo: self.coinsTitleLabel.bottomAnchor, constant: 8),
            self.coinsCard.heightAnchor.constraint(equalToConstant: 120),
            self.coinsCard.widthAnchor.constraint(equalToConstant: 120),
            
            self.coinsTitleLabel.centerXAnchor.constraint(equalTo: self.coinsCard.centerXAnchor),
            self.coinsTitleLabel.topAnchor.constraint(equalTo: self.stepsCard.bottomAnchor, constant: 24),
            self.coinsTitleLabel.heightAnchor.constraint(equalToConstant: 64),
            self.coinsTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            self.coinsLabel.centerXAnchor.constraint(equalTo: self.coinsCard.centerXAnchor),
            self.coinsLabel.centerYAnchor.constraint(equalTo: self.coinsCard.centerYAnchor),
            self.coinsTitleLabel.heightAnchor.constraint(equalToConstant: 44),
            self.coinsTitleLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setupSleepCard() {
        self.addSubview(sleepCard)
        self.sleepCard.addSubview(sleepLabel)
        self.addSubview(sleepTitleLabel)
        NSLayoutConstraint.activate([
            self.sleepCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.sleepCard.topAnchor.constraint(equalTo: self.sleepTitleLabel.bottomAnchor, constant: 8),
            self.sleepCard.heightAnchor.constraint(equalToConstant: 120),
            self.sleepCard.widthAnchor.constraint(equalToConstant: 120),
            
            self.sleepTitleLabel.centerXAnchor.constraint(equalTo: self.sleepCard.centerXAnchor),
            self.sleepTitleLabel.topAnchor.constraint(equalTo: self.stepsCard.bottomAnchor, constant: 24),
            self.sleepTitleLabel.heightAnchor.constraint(equalToConstant: 64),
            self.sleepTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            self.sleepLabel.centerXAnchor.constraint(equalTo: self.sleepCard.centerXAnchor),
            self.sleepLabel.centerYAnchor.constraint(equalTo: self.sleepCard.centerYAnchor),
            self.sleepTitleLabel.heightAnchor.constraint(equalToConstant: 44),
            self.sleepTitleLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}

