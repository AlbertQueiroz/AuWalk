//
//  StoreRepository.swift
//  AuWalk
//
//  Created by Albert Rayneer on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

class StoreRepository {
    func allItems(completion: @escaping ([Item]) -> Void) {
        HTTP.get.request(url: StoreAPI.allItems.url) { data, response, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                completion([])
                return
            }
            
            guard let data = data, let response = response else {
                completion([])
                return
            }
            
            switch response.statusCode {
            case 200:
                let items: [Item] = (try? JSONDecoder().decode(Array<Item>.self, from: data)) ?? []
                completion (items)
                return
            default:
                completion([])
                return
            }
        }
    }
}
