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
    
    let statsButton: UIButton = {
        let sb = UIButton()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.setImage(UIImage(named: "chart.bar.fill"), for: .normal)
        sb.backgroundColor = .yellowButton
        sb.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        sb.imageView?.tintColor = .brownButton
        
        return sb
    }()
    
    let profileButton: UIButton = {
        let pb = UIButton()
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.setImage(UIImage(named: "person.fill"), for: .normal)
        pb.backgroundColor = .yellowButton
        pb.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        pb.imageView?.tintColor = .brownButton
        
        return pb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTopBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(pawMoney)
        addSubview(coinMoney)
        addSubview(statsButton)
        addSubview(profileButton)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        statsButton.layer.cornerRadius = statsButton.frame.height/2
        profileButton.layer.cornerRadius = profileButton.frame.height/2
    }
    
    func setupTopBar() {
        
        NSLayoutConstraint.activate([
        
            pawMoney.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.25),
            pawMoney.heightAnchor.constraint(equalTo: self.heightAnchor),
            pawMoney.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            coinMoney.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.25),
            coinMoney.heightAnchor.constraint(equalTo: self.heightAnchor),
            coinMoney.leftAnchor.constraint(equalTo: pawMoney.rightAnchor, constant: 5),
            
            profileButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            profileButton.heightAnchor.constraint(equalTo: self.heightAnchor),
            profileButton.widthAnchor.constraint(equalTo: statsButton.heightAnchor),
            
            statsButton.rightAnchor.constraint(equalTo: profileButton.leftAnchor, constant: -15),
            statsButton.heightAnchor.constraint(equalTo: self.heightAnchor),
            statsButton.widthAnchor.constraint(equalTo: statsButton.heightAnchor),
            
        ])
            
    }
    
}

enum MoneyType {
    case paw, coin
}
