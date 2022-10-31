//
//  userData.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

struct UserData : Encodable, Decodable {
    
    var steps : Int
    var normalCoinsTotal : Int
    var goldenCoinsTotal : Int
    var levelPet : Int
    var levelPersonal : Int
    var statusHeart : Float
    var statusFood : Float
    var statusHygiene : Float
    var statusEnergy : Float
    
    init(
        steps: Int = 0,
        normalCoinsTotal: Int = 0,
        goldenCoinsTotal: Int = 0,
        levelPet: Int = 0,
        levelPersonal: Int = 0,
        statusHeart: Float = 0,
        statusFood: Float = 0,
        statusHygiene: Float = 0,
        statusEnergy: Float = 0
    ) {
         self.steps = steps
         self.normalCoinsTotal = normalCoinsTotal
         self.goldenCoinsTotal = goldenCoinsTotal
         self.levelPet = levelPet
         self.levelPersonal = levelPersonal
         self.statusHeart = statusHeart
         self.statusFood = statusFood
         self.statusHygiene = statusHygiene
         self.statusEnergy = statusEnergy
     }
}
