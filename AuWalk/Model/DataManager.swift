//
//  DataManager.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 18/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation


public class ManagerData {
    
    
    var steps : Int
    var normalCoinsTotal : Int
    var goldenCoinsTotal : Int
    var levelPet : Int
    var levelPersonal : Int
    var statusHeart : Float
    var statusFood : Float
    var statusHygiene : Float
    var statusEnergy : Float
 
    init(steps: Int, normalCoinsTotal: Int, goldenCoinsTotal: Int, levelPet: Int, levelPersonal: Int, statusHeart: Float, statusFood: Float, statusHygiene: Float, statusEnergy: Float) {
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
    
    
    
    func atualizarCategoria(category: String?, Price: Int?){
        switch category{
        case "3":
            switch Price {
            case 300:
                self.statusHeart += 0.25
            case 600:
                self.statusHeart += 0.50
            default:
                return
            }
        case "1":
            switch Price {
                       case 250:
                        self.statusFood += 0.2
                       case 300:
                        self.statusFood += 0.3
                       case 500:
                        self.statusFood += 0.5
                       default:
                           return
                       }
        case "2":
            switch Price {
                       case 300:
                        self.statusHygiene += 0.2
                       case 500:
                        self.statusHygiene += 0.45
                       case 700:
                        self.statusHygiene += 0.65
                       default:
                           return
                       }
        case "4":
            switch Price {
                       case 500:
                        self.statusEnergy += 0.5
                       default:
                           return
                       }
        default:
            return
        }
    }
}

protocol updateDelegate: class {
    func usedItemChanges (category: String?, price : Int?)
    func retornoData (category: String?) -> Float
}

extension ManagerData : updateDelegate{
    
    func usedItemChanges(category: String?, price : Int?){
        atualizarCategoria(category: category, Price: price)
  }
    func retornoData(category: String?) -> Float {
        switch category {
        case "1":
            return self.statusFood
        case "2":
            return self.statusHygiene
        case "3":
            return self.statusHeart
        case "4":
            return self.statusEnergy
        default:
            return 0.0
        }
    }
    
}

