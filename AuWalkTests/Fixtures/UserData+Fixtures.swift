//
//  UserData+Fixtures.swift
//  AuWalkTests
//
//  Created by Fernando de Lucas da Silva Gomes on 31/10/22.
//  Copyright © 2022 AuWalk. All rights reserved.
//

@testable import AuWalk

extension UserData {
    static func fixture(
        steps: Int = 0,
        normalCoinsTotal: Int = 0,
        goldenCoinsTotal: Int = 0,
        levelPet: Int = 0,
        levelPersonal: Int = 0,
        statusHeart: Float = 0,
        statusFood: Float = 0,
        statusHygiene: Float = 0,
        statusEnergy: Float = 0
    ) -> Self {
        .init(
            steps: steps,
            normalCoinsTotal: normalCoinsTotal,
            goldenCoinsTotal: goldenCoinsTotal,
            levelPet: levelPet,
            levelPersonal: levelPersonal,
            statusHeart: statusHeart,
            statusFood: statusFood,
            statusHygiene: statusHygiene,
            statusEnergy: statusEnergy
        )
    }
}
