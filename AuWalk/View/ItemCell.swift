//
//  ItemCell.swift
//  AuWalk
//
//  Created by Tales Conrado on 11/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var item: Item?
    
    lazy var descriptionStackView: UIStackView = {
        let dsv = UIStackView()
        dsv.translatesAutoresizingMaskIntoConstraints = false
        
        return dsv
    }()
    
    lazy var purchaseStackView: UIStackView = {
        let psv = UIStackView()
        psv.translatesAutoresizingMaskIntoConstraints = false
        
        return psv
    }()
    
    lazy var itemImage: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: item!.image)
        return im
    }()
    
    
    lazy var itemName: UILabel = {
        let itn = UILabel()
        itn.translatesAutoresizingMaskIntoConstraints = false
        itn.text = item!.name
        itn.textColor = .black
        
        return itn
    }()
    
    
    lazy var itemDescription: UILabel = {
        let itd = UILabel()
        itd.translatesAutoresizingMaskIntoConstraints = false
        itd.font = UIFont.systemFont(ofSize: 14)
        itd.text = item!.description
        itd.lineBreakMode = .byWordWrapping
        itd.numberOfLines = 0
        itd.textColor = .black
        
        return itd
    }()
    
    
    lazy var useItemButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Usar", for: .normal)
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    
    lazy var itemPrice: MoneyView = {
        let ip = MoneyView(coin: UIImage(named: "dogpaw"), amount: item!.price)
        ip.translatesAutoresizingMaskIntoConstraints = false
        ip.moneyLabel.font = UIFont.systemFont(ofSize: 14)
        ip.moneyLabel.textColor = .black
        ip.moneyLabel.textAlignment = .justified
        ip.coinView.tintColor = .brownButton
        
        return ip
    }()
    
    
    convenience init(of item: Item) {
        self.init()
        self.item = item
        
        guard self.item != nil else {
            fatalError("Invalid item.")
        }
        backgroundColor = .yellowButton
        addSubview(itemImage)
        setupStackViews()
        setupContraints()
    }
    
    
    func setupStackViews() {
        
        descriptionStackView.addArrangedSubview(itemName)
        descriptionStackView.addArrangedSubview(itemDescription)
        descriptionStackView.alignment = .top
        descriptionStackView.axis = .vertical
        
        purchaseStackView.addArrangedSubview(useItemButton)
        purchaseStackView.addArrangedSubview(itemPrice)
        purchaseStackView.alignment = .center
        purchaseStackView.axis = .vertical
        
        addSubview(descriptionStackView)
        addSubview(purchaseStackView)
        
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
        
            itemImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            itemImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor),
            itemImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            descriptionStackView.leftAnchor.constraint(equalTo: itemImage.rightAnchor, constant: 10),
            descriptionStackView.rightAnchor.constraint(lessThanOrEqualTo: purchaseStackView.leftAnchor, constant: -30),
            descriptionStackView.heightAnchor.constraint(lessThanOrEqualTo: itemImage.heightAnchor),
            descriptionStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            purchaseStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            purchaseStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            purchaseStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            purchaseStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        
        ])
        
    }
    
}
