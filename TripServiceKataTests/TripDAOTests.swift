//
//  TripDAOTests.swift
//  TripServiceKataTests
//
//  Created by Fabio Mignogna on 19/10/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
@testable import TripServiceKata

class TripDAOTests: XCTestCase {
    
    func test_findTrips_throwsDependantClassCalledError() {
        let sut = TripDAO()
        let aUser = UserBuilder(builderClosure: {_ in}).build()
        XCTAssertThrowsError(try sut.findTrips(by: aUser)) { error in
            XCTAssertTrue(error is UnitTestError)
        }
    }
}
