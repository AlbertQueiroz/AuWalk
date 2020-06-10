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
    
    var coin: UIImage?
    var money: Int?
    
    lazy var coinView: UIImageView = {
        let cv = UIImageView(image: self.coin)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var moneyLabel: UILabel = {
        let ml = UILabel()
        ml.text = String(describing: self.money)
        ml.translatesAutoresizingMaskIntoConstraints = false
        return ml
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(coin: UIImage, money: Int) {
        self.init()
        self.coin = coin
        self.money = money
    }
    
    func setupViews() {
        addSubview(coinView)
        addSubview(moneyLabel)
    }
    
    
}

