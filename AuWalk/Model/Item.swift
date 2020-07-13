//
//  structItens.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

public struct Item : Decodable, Encodable {
    var id : Int
    var name : String
    var description : String
    var price : Int
    var category : String
    var image : String
    
    init (id : Int, name : String, description: String, price: Int, category : String, image : String ) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.category = category
        self.image = image
    }
}
