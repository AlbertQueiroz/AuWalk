//
//  TopBar.swift
//  AuWalk
//
//  Created by Tales Conrado on 09/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class TopBar: UIView {
    
    let pawMoney: MoneyView = {
        let mv = MoneyView(coin: UIImage(named: "dogpaw"), amount: 3400)
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    let coinMoney: MoneyView = {
        let cv = MoneyView(coin: UIImage(named: "coin"), amount: 30)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateValue(from moneyType: MoneyType, to amount: Int) {
        switch moneyType {
            case .coin:
                coinMoney.moneyLabel.text = String(amount)
            case .paw:
                pawMoney.moneyLabel.text = String(amount)
        }
    }
    
    
    func setupViews() {
        addSubview(pawMoney)
        addSubview(coinMoney)
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            pawMoney.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.25),
            pawMoney.heightAnchor.constraint(equalTo: self.heightAnchor),
            pawMoney.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            coinMoney.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.25),
            coinMoney.heightAnchor.constraint(equalTo: self.heightAnchor),
            coinMoney.leftAnchor.constraint(equalTo: pawMoney.rightAnchor, constant: 5)
        
        ])
        
    }
    
}

enum MoneyType {
    case paw, coin
}
