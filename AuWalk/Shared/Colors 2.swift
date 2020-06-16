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
}
