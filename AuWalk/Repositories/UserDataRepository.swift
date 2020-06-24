//
//  ItemRepository.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 22/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

func createNewFile(data: userData) -> Data?{
    
    if let data = try? JSONEncoder().encode(data){
        FileController().createFile(with: data, name: "UserData.Json")
        return data
    }
    return nil
}

func readUserDataFromFile() -> userData?{
    
    if let data = FileController().retrieveFile(at: "UserData.Json"){
        let userData = try? JSONDecoder().decode(userData.self, from: data)
        return userData
    }
    return nil
}

func updateUserDataFile(data : userData) -> Data?{
    
    if let data = try? JSONEncoder().encode(data){
        FileController().updateFile(at: "UserData.Json", data: data)
        return data
    }
    return nil
}
