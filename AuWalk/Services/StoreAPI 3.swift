//
//  StoreAPI.swift
//  AuWalk
//
//  Created by Albert Rayneer on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

enum StoreAPI: Router {
    
    case allItems
    case food
    case shower
    case health
    case energy
    
    var hostname: String {
        get {
            return "https://api-auau.herokuapp.com"
        }
    }
    
    var url: URL? {
        get {
            switch self {
            case .allItems: return URL(string: "\(hostname)/item")
            case .food: return URL(string: "\(hostname)/item?category=1")
            case .shower: return URL(string: "\(hostname)/item?category=2")
            case .health: return URL(string: "\(hostname)/item?category=3")
            case .energy: return URL(string: "\(hostname)/item?category=4")
            }
        }
    }
    
    
}
