//
//  Router.swift
//  AuWalk
//
//  Created by Albert Rayneer on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

protocol Router {
    var hostname: String { get }
    var url: URL? { get }
}
