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
    
    static let ITALY: Trip = Trip()
    static let IRELAND: Trip = Trip()
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
    
    func test_trips_giveLoggedInUserIsFriendWithUser_shouldReturnFriendTrips() {
        TestableTripService.currentUser = TestConstant.REGISTERED
        let user = User()
        user.addFriend(TestConstant.REGISTERED)
        user.addFriend(TestConstant.A_USER)
        user.addTrip(TestConstant.ITALY)
        user.addTrip(TestConstant.IRELAND)
        XCTAssertEqual(try! TestableTripService.trips(by: user), [TestConstant.ITALY, TestConstant.IRELAND])
    }
}

private class TestableTripService: TripService {
    
    static var currentUser: User?
    
    override class func getLoggedUser() throws -> User? {
        return currentUser
    }
    
    override class func getTrips(by user: User) throws -> [Trip] {
        return user.trips
    }
}
