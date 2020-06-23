//
//  StepsConversionTests.swift
//  AuWalkTests
//
//  Created by Tales Conrado on 22/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import XCTest
@testable import AuWalk

class StepsCounterModel: XCTestCase {

    var sut: PetViewController!
    
    override func setUp() {
        super.setUp()
        sut = PetViewController()
    }
    
    func test_InitializingHKStore_isNotNil() {
    
        let store = sut.stepsCounterModel.healthStore
        
        XCTAssertNotNil(store)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}
