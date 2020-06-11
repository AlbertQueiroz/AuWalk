//
//  structItens.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

public struct Item : Decodable, Encodable {
    var name : String
    var description : String
    var price : Int
    var category : String
    
    init (name : String, description: String, price: Int, category : String ) {
        self.name = name
        self.description = description
        self.price = price
        self.category = category
    }
}
