//
//  File.swift
//  AuWalk
//
//  Created by Fernando de Lucas da Silva Gomes on 31/10/22.
//  Copyright © 2022 AuWalk. All rights reserved.
//

import Foundation

final class PetViewModel {
    private let userDataRepository: UserDataRepository
    
    init(userDataRepository: UserDataRepository) {
        self.userDataRepository = userDataRepository
    }

    func getLocalUserData() -> UserData? {
        userDataRepository.readDataFromFile()
    }
    
    func updateUserData(user: UserData) {
       let _ =  userDataRepository.updateUserDataFile(data: user)
    }
}
