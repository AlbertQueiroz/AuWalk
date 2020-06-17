//
//  StepsToCoinsViewTests.swift
//  AuWalkTests
//
//  Created by Albert Rayneer on 17/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import XCTest
@testable import AuWalk

class StepsToCoinsViewTests: XCTestCase {

    func test_configureDaySteps_10stepsMultiplier10_100coins() {
        //given
        let sut = StepsToCoinsView()
        let steps = 10
        let multiplier = 10
        //when
        sut.configureDaySteps(daySteps: steps, multiplier: multiplier)
        let output = sut.coinsLabel.text
        //then
        XCTAssertEqual(output, "100")
    }
}
