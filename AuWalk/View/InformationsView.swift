//
//  InformationsView.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class InformationsView: UIView {
    

    lazy var stepsToCoin: StepsToCoinsView = {
        let v = StepsToCoinsView()
        return v
    }()
    
    lazy var petName: UILabel = {
        var label = UILabel()
        label.text = "Default Text"
        label.textColor = .greenLabel

        label.font = sfRounded(size: 26)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var messageDay: UILabel = {
        var label = UILabel()
        label.text = "Default message the day"
        label.textColor = .greenLabel

        label.font = sfRounded(size: 18)
        label.textAlignment = .center
        label.numberOfLines = .init(bigEndian: 3)
        return label
    }()
    
    lazy var today: UILabel = {
        var label = UILabel()
        label.text = "Hoje"
        label.textColor = .greenLabel

        label.font = sfRounded(size: 18)
        label.textAlignment = .center
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
    
    func setupInformations(petName: String?, message: String?, steps: Int?, multiplierSteps multiplier: Int = 11){
        if let petName = petName {
            self.petName.text = petName
        }
        if let message = message {
            self.messageDay.text = message
        }
        if let steps = steps {
            self.stepsToCoin.configureDaySteps(daySteps: steps, multiplier: multiplier)
        }
    }
    
    func setupInformations(){
        
        let stackViewInformations = UIStackView(arrangedSubviews: [petName, messageDay, today, stepsToCoin])
        stackViewInformations.translatesAutoresizingMaskIntoConstraints = false
        stackViewInformations.axis = .vertical

        stackViewInformations.setCustomSpacing(18, after: petName)
        stackViewInformations.setCustomSpacing(24, after: messageDay)
        stackViewInformations.setCustomSpacing(12, after: today)
        
        self.addSubview(stackViewInformations)
        
        NSLayoutConstraint.activate([
            stackViewInformations.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewInformations.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
