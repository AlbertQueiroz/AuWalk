//
//  cardView.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

class HomePetStatusCardView : UIView {
    
    let progressCircle : CAShapeLayer = {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 20, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.lineCap = .round
        layer.strokeEnd = 1
        layer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        return layer
    }()
    
    let imageIconView : UIImageView = {
        let imageView = UIImageView ()
        let image = #imageLiteral(resourceName: "heartIcon")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
         
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        self.layer.addSublayer(progressCircle)
        imageIconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageIconView)
    }
    
    //added image constraint to position inside circle
    func setupContraints() {
                
        NSLayoutConstraint.activate([
        
            imageIconView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageIconView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
        
    }
    
    
}
