//
//  MoneyView.swift
//  AuWalk
//
//  Created by Tales Conrado on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

//reusable view component for showing in game currency
class MoneyView: UIView {
    
    lazy var coinView: UIImageView = {
        let cv = UIImageView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentMode = .scaleAspectFit

        return cv
    }()
    
    lazy var moneyLabel: UILabel = {
        let ml = UILabel()
        ml.text = "0"
        ml.translatesAutoresizingMaskIntoConstraints = false
        ml.font = UIFont.systemFont(ofSize: 20)
        ml.textColor = .greenLabel
        
        return ml
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(coin: UIImage?, amount: Int) {
        self.init()
        guard let coin = coin else {
            print("Invalid image for coin")
            return
        }
        coinView.image = coin
        moneyLabel.text = String(amount)
    }
    
    func updateAmount(amount: Int) {
        self.moneyLabel.text = String(amount)
    }
    
    func setupViews() {
        addSubview(coinView)
        addSubview(moneyLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            coinView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            coinView.topAnchor.constraint(equalTo: self.topAnchor),
            coinView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coinView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            coinView.heightAnchor.constraint(equalTo: moneyLabel.heightAnchor),
            
            moneyLabel.leftAnchor.constraint(equalTo: coinView.rightAnchor, constant: 2),
            moneyLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        
        ])
        
    }
    
    
}

