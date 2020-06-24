//
//  colors.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let redHeart = UIColor.rgb(r: 237, g: 85 , b: 85)
    static let greenFood = UIColor.rgb(r: 28, g:189, b: 103)
    static let orangeEnergy = UIColor.rgb(r: 250, g:173, b: 83)
    static let blueHygiene = UIColor.rgb(r: 82, g: 195, b: 255)
    static let greenLight = UIColor.rgb(r: 245, g: 255, b: 237)
    static let greenLightBar = UIColor.rgb(r:227 , g: 239, b: 217)
    static let yellowButton = UIColor.rgb(r: 245, g: 255, b: 238)
    static let brownButton = UIColor.rgb(r: 116, g: 76, b: 52)
    static let greenDisabledCells = UIColor.rgb(r: 227, g: 238, b: 217)
    
    
    static var onBoardingBackgroundColor = UIColor(red: 1.00, green: 0.99, blue: 0.98, alpha: 1.00)
    static var orangeButton = UIColor(red: 0.95, green: 0.65, blue: 0.36, alpha: 1.00)
    static let brownCoin =  UIColor(red: 0.46, green: 0.30, blue: 0.20, alpha: 1.00)
    static let greenLabel = UIColor(red: 0.13, green: 0.16, blue: 0.12, alpha: 1.00)
}

