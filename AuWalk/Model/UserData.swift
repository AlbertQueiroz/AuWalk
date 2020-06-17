//
//  userData.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

struct UserData : Encodable, Decodable {
    
    var steps : Int?
    var normalCoinsTotal : Int?
    var goldenCoinsTotal : Int?
    var levelPet : Int?
    var levelPersonal : Int?

    init (steps : Int?, normalCoinsTotal : Int,goldenCoinsTotal : Int, levelPet : Int, levelPersonal : Int?){
        self.steps = steps
        self.normalCoinsTotal = normalCoinsTotal
        self.goldenCoinsTotal = goldenCoinsTotal
        self.levelPet = levelPet
        self.levelPersonal = levelPersonal
    }

}
