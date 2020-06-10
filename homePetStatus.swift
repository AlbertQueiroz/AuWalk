//
//  homePetStatus.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class homePetStatusView : UIView {
    
    let cardHeart : homePetStatusCardView = {
        let card = homePetStatusCardView()
        card.progressCircle.position = CGPoint(x: 86, y: 29)
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.redHeart.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "heartIcon")

        return card
        
    }()
    
    let cardFood : homePetStatusCardView = {
        let card = homePetStatusCardView()
        card.progressCircle.position = CGPoint(x: 86, y: 29)
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.greenFood.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "foodIcon")

        
        return card
        
    }()
    
    let cardHygiene : homePetStatusCardView = {
        let card = homePetStatusCardView()
        card.progressCircle.position = CGPoint(x: 86, y: 29)
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.blueHygiene.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "hygieneIcon")

        
        return card
        
    }()
    
    let cardEnergy : homePetStatusCardView = {
        let card = homePetStatusCardView()
        card.progressCircle.position = CGPoint(x: 86, y: 29)
        card.progressCircle.fillColor = UIColor.clear.cgColor
        card.progressCircle.lineWidth = 4
        card.progressCircle.strokeColor = UIColor.orangeEnergy.cgColor
        card.imageIconView.image = #imageLiteral(resourceName: "energyIcon")
        return card
        
    }()
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupView()
       }
       
       func setupView(){
           addSubview(cardFood)
            addSubview(cardHeart)
        addSubview(cardHygiene)
        addSubview(cardEnergy)
       }
    
}
