//
//  structItens.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 10/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

public struct itensDecoder : Decodable {
    var name : String
    var description : String
    var price : Int
    init (name : String, description: String, price: Int) {
        self.name = name
        self.description = description
        self.price = price
    }
}
