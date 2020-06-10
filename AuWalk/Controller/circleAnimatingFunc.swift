//
//  circleAnimatingFunc.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

func animatingCircle (fromValue: Float, toValue: Float) -> CABasicAnimation {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
         basicAnimation.toValue = toValue
    basicAnimation.fromValue = fromValue
         basicAnimation.duration = 1
         basicAnimation.fillMode = .forwards
         basicAnimation.isRemovedOnCompletion = false
         return basicAnimation
}
