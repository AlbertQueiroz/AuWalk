//
//  HTTP.swift
//  AuWalk
//
//  Created by Albert Rayneer on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

enum HTTP {
    
    case get
    
    func request(url:URL?,
                 header:[String:String] = ["Content-Type":"application/json"],
                 body:[String:Any] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = {data, response, error in }) {
        
        guard let url = url else {
            completion(nil, nil, "URL Inválida")
            return
        }
        
        switch self {
        case .get:
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
        }
    }
    
}
