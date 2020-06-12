//
//  ItemCell.swift
//  AuWalk
//
//  Created by Tales Conrado on 11/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var descriptionStackView: UIStackView = {
        let dsv = UIStackView()
        dsv.translatesAutoresizingMaskIntoConstraints = false
        
        return dsv
    }()
    
    var itemImage: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    
    var itemName: UILabel = {
        let itn = UILabel()
        itn.translatesAutoresizingMaskIntoConstraints = false
        
        return itn
    }()
    
    
    var itemDescription: UILabel = {
        let itd = UILabel()
        itd.translatesAutoresizingMaskIntoConstraints = false
        
        return itd
    }()
    
    
    var useItemButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Usar", for: .normal)
        
        return btn
    }()
    
    
    var itemPrice: MoneyView = {
        let ip = MoneyView(coin: UIImage(named: "dogpaw"), amount: 0)
        ip.translatesAutoresizingMaskIntoConstraints = false
        
        return ip
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemImage)
        addSubview(itemPrice)
        addSubview(useItemButton)
        setupStackViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackViews() {
        
        descriptionStackView.addArrangedSubview(itemName)
        descriptionStackView.addArrangedSubview(itemDescription)
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.alignment = .leading
        descriptionStackView.axis = .vertical
        addSubview(descriptionStackView)
        
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
        
            itemImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            itemImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor),
            
            descriptionStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionStackView.leftAnchor.constraint(equalTo: itemImage.rightAnchor, constant: 10)
        
        
        ])
        
    }
    
    
}
