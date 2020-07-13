//
//  DataManager.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 18/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

enum Prices: Int{
    case cheap = 300
    case normal = 600
    case great = 900
    case defaultValue = 0
    
    func returnProgress() -> Float {
        switch self {
        case .cheap:
            return 0.15
        case .normal:
            return 0.35
        case .great:
            return 0.70
        case .defaultValue:
            return 0
        }
    }
}

public class DataManager {
    
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
    
    init(data: UserData){
        self.steps = data.steps
        self.normalCoinsTotal = data.normalCoinsTotal
        self.goldenCoinsTotal = data.goldenCoinsTotal
        self.levelPersonal = data.levelPersonal
        self.levelPet = data.levelPet
        self.statusHeart = data.statusHeart
        self.statusFood = data.statusFood
        self.statusEnergy = data.statusEnergy
        self.statusHygiene = data.statusHygiene
    }
 
    func atualizarCategoria(category: String?, Price: Int?) {
        
        guard let price = Price else { return }
        
        let priceEnum: Prices = Prices(rawValue: price) ?? Prices(rawValue: 0)!
        
        switch category{
        case "3":
            self.statusHeart += priceEnum.returnProgress()
        case "1":
            self.statusFood += priceEnum.returnProgress()
        case "2":
            self.statusHygiene += priceEnum.returnProgress()
        case "4":
            self.statusEnergy += priceEnum.returnProgress()
        default:
            return
        }
    }
}

protocol updateDelegate: class {
    func usedItemChanges (category: String?, price : Int?)
    func retornoData (category: String?) -> Float
    func atualizarDados()
}

extension DataManager : updateDelegate{
    
    func usedItemChanges(category: String?, price : Int?){
        atualizarCategoria(category: category, Price: price)
        self.normalCoinsTotal = self.normalCoinsTotal - price!
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
    
    func atualizarDados(){
        let userData = UserData(steps: self.steps, normalCoinsTotal: self.normalCoinsTotal, goldenCoinsTotal: self.goldenCoinsTotal, levelPet: self.levelPet, levelPersonal: self.levelPersonal, statusHeart: self.statusHeart, statusFood: self.statusFood, statusHygiene: self.statusHygiene, statusEnergy: self.statusEnergy)
        
        
        if updateUserDataFile(data: userData) != nil{
            print("sucesso ao atualizar")
        } else {
            print("erro")
        }
    }
}

