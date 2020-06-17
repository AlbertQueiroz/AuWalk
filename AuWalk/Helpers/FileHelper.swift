//
//  FileManager.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 15/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

struct FileHelper {
    
    let manager = FileManager.default
    let mainPath  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func savingData(with json : UserData) -> Bool{

        if let data = try? JSONEncoder().encode(json){

            if(try! savingManager(with: data)){
                print("Sucesso ao criar arquivo")
                return true
            } else {
                print("Erro ao criar arquivo")
                return false
            }
        }else {
            print("Erro ao codar Json")
            return false
        }
        
    }



    func savingManager(with data : Data?) throws -> Bool{
        let toCreate = mainPath.appendingPathComponent("UserData.json").path
        
        let fileUrl = URL(string: toCreate)
        
        manager.createFile(atPath: fileUrl!.path, contents: data, attributes: nil)
        if (manager.fileExists(atPath: mainPath.path)){
            return true
        } else{ return false }
    }

    func getFile(){
        print(Bundle.main.path(forResource: "UserData", ofType: "json")!)
        let filePath = mainPath
        
        let data = try? Data(contentsOf: filePath)
        let decodado = try? JSONDecoder().decode(UserData.self, from: data!)
        print(decodado!)
    }
}
