//
//  FileManager.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

struct FileController {
    
    let manager = FileManager.default
    let mainPath  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @discardableResult
    func createFile(with data: Data, name: String) -> Bool {
        let contentPath = constructPath(named: name)
        manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
        return manager.fileExists(atPath: contentPath.path)
    }
    
    func updateFile(at path: String, data: Data) -> Bool {
        let contentPath = constructPath(named: path)
        do {
            try data.write(to: contentPath)
            return true
        } catch {
            return false
        }
    }
    
    func constructPath(named: String, from path: String? = nil) -> URL {
        let contentPath = mainPath
        if let path = path {
            return contentPath.appendingPathComponent(path).appendingPathComponent(named)
        } else {
            return contentPath.appendingPathComponent(named)
        }
    }
    
    func retrieveFile(at path: String) -> Data? {
        let contentPath = constructPath(named: path)
        let data = try? Data(contentsOf: contentPath)
        return data
    }
    
}
