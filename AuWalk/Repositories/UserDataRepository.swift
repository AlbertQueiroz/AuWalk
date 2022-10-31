//
//  ItemRepository.swift
//  AuWalk
//
//  Created by Fernando de Lucas on 22/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

final class UserDataRepository {
    
    private let fileName = "UserData.Json"
    
    func createNewFile(data: UserData) -> Data? {

        guard let data = try? JSONEncoder().encode(data) else {
            return nil
        }
        FileController().createFile(
            with: data,
            name: fileName
        )
        return data
    }
    
    func readDataFromFile() -> UserData? {
        guard let data = FileController().retrieveFile(at: fileName) else {
            return nil
        }
        let userData = try? JSONDecoder().decode(UserData.self, from: data)

        return userData
    }
    
    func updateUserDataFile(data : UserData) -> Data? {
        guard
            let data = try? JSONEncoder().encode(data),
            FileController().updateFile(
                at: fileName,
                data: data
            )
        else {
            return nil
        }
        return data
    }
    
}
