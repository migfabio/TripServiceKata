//
//  TripServiceTests.swift
//  TripServiceKataTests
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
@testable import TripServiceKata

class TripServiceTests: XCTestCase {
    
    func test_trips_givenLoggedOutUser_shouldThrownNotLoggedInError() {
        XCTAssertThrowsError(try TestableTripService.trips(by: User()))
    }
}

private class TestableTripService: TripService {
    
    override class func getLoggedUser() throws -> User? {
        return nil
    }
}
