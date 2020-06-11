//
//  InformationsView.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class InformationsView: UIView {
    
    lazy var petName: UILabel = {
        var label = UILabel()
        label.text = "Default Text"
        label.textColor = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)

        label.font = sfRounded(size: 26)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var messageDay: UILabel = {
        var label = UILabel()
        label.text = "Default message the day"
        label.textColor = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)

        label.font = sfRounded(size: 18)
        label.textAlignment = .center
        label.numberOfLines = .init(bigEndian: 3)
        return label
    }()
    
    lazy var today: UILabel = {
        var label = UILabel()
        label.text = "Hoje"
        label.textColor = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)

        label.font = sfRounded(size: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var stepsDay: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.textColor = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)

        label.font = sfRounded(size: 18)
        return label
    }()
    
    lazy var coinsDay: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.textColor = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)

        label.font = sfRounded(size: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupInformations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sfRounded(size: CGFloat) -> UIFont{
        
        let systemFont = UIFont.systemFont(ofSize: size)
        if #available(iOS 13.0, *) {
            let descriptor = systemFont.fontDescriptor.withDesign(.rounded)
            let roundedFont = UIFont(descriptor: descriptor!, size: size)
            
            return roundedFont
        } else {
            return systemFont
        }
    }
    
    func setupInformations(petName: String?, message: String?, coins: String?, coinsDay: String?){
        if let petName = petName {
            self.petName.text = petName
        }
        if let message = message {
            self.messageDay.text = message
        }
        if let coins = coins {
            self.coinsDay.text = coins
        }
        if let coinsDay = coinsDay {
            self.coinsDay.text = coinsDay
        }
    }
    
    func setupInformations(){
        let stackViewStepCoins = UIStackView(arrangedSubviews: [coinsDay, stepsDay])
        stackViewStepCoins.translatesAutoresizingMaskIntoConstraints = false
        stackViewStepCoins.axis = .horizontal
        stackViewStepCoins.distribution = .fillEqually
        
        let stackViewInformations = UIStackView(arrangedSubviews: [petName, messageDay, today, stackViewStepCoins])
        stackViewInformations.translatesAutoresizingMaskIntoConstraints = false
        stackViewInformations.axis = .vertical
        stackViewInformations.distribution = .equalCentering
        
        stackViewInformations.setCustomSpacing(18, after: petName)
        stackViewInformations.setCustomSpacing(24, after: messageDay)
        stackViewInformations.setCustomSpacing(12, after: today)
        
        self.addSubview(stackViewInformations)
        
        NSLayoutConstraint.activate([
            stackViewInformations.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewInformations.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
