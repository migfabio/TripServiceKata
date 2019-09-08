//
//  TripServiceTests.swift
//  TripServiceKataTests
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
@testable import TripServiceKata

struct TestConstant {
    static let GUEST: User? = nil
    static let REGISTERED: User = User()
    static let A_USER: User = User()
}

class TripServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        TestableTripService.currentUser = nil
    }
    
    func test_trips_givenLoggedOutUser_shouldThrownNotLoggedInError() {
        TestableTripService.currentUser = TestConstant.GUEST
        XCTAssertThrowsError(try TestableTripService.trips(by: TestConstant.A_USER))
    }
    
    func test_trips_givenLoggedInUserNotFriendWithUser_shouldReturnEmptyArray() {
        TestableTripService.currentUser = TestConstant.REGISTERED
        let user = User()
        user.addFriend(TestConstant.A_USER)
        XCTAssertEqual(try! TestableTripService.trips(by: user), [])
    }
}

private class TestableTripService: TripService {
    
    static var currentUser: User?
    
    override class func getLoggedUser() throws -> User? {
        return currentUser
    }
}