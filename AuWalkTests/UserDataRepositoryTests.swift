//
//  UserDataRepositoryTests.swift
//  AuWalkTests
//
//  Created by Fernando de Lucas da Silva Gomes on 31/10/22.
//  Copyright © 2022 AuWalk. All rights reserved.
//

import XCTest
@testable import AuWalk

final class UserDataRepositoryTests: XCTestCase {
    
    private let fileControllerMock = FileControllerMock()

    private lazy var sut = UserDataRepository(fileController: fileControllerMock)
    
    func test_createNewFile_whenFileControllerCreatesNewFile_shouldNotReturnNil() {
        fileControllerMock.createFileMock = false

        let result = sut.createNewFile(data: .fixture())
        
        XCTAssertNotNil(result)
    }
    
    func test_createNewFile_whenFileControllerDoesNotCreatesNewFile_shouldReturnNil() {
        let result = sut.createNewFile(data: .fixture())
        
        XCTAssertNil(result)
    }

    func test_updateUserDataFile_whenFileControllerUpdatesFile_shouldNotReturnNil() {
        fileControllerMock.updateFileMock = false

        let result = sut.updateUserDataFile(data: .fixture())
        
        XCTAssertNotNil(result)
    }
    
    func test_updateUserDataFile_whenFileControllerDoesNotUpdateFile_shouldReturnNil() {
        let result = sut.createNewFile(data: .fixture())
        
        XCTAssertNil(result)
    }
    
    
}
