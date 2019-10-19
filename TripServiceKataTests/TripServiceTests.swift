//
//  TripServiceTests.swift
//  TripServiceKataTests
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
import TripServiceKata

struct TestConstant {
    static let GUEST: User? = nil
    static let REGISTERED: User = User()
    static let A_USER: User = User()
    static let ALICE: User = User()
    static let BOB: User = User()
    
    static let ITALY: Trip = Trip()
    static let IRELAND: Trip = Trip()
}

class TripServiceTests: XCTestCase {
    
    func test_trips_givenLoggedOutUser_shouldThrownNotLoggedInError() {
        XCTAssertThrowsError(try makeSUT().trips(by: TestConstant.A_USER, loggedInUser: TestConstant.GUEST)) { error in
            XCTAssertEqual(error as? UserError, UserError.notLoggedIn)
        }
    }
    
    func test_trips_givenLoggedInUserNotFriendWithUser_shouldReturnEmptyArray() {
        let user = UserBuilder {
            $0.friends = [TestConstant.A_USER]
            $0.trips = [TestConstant.ITALY]
        }.build()
        XCTAssertEqual(try? makeSUT(withTrips: user.trips).trips(by: user, loggedInUser: TestConstant.REGISTERED), [])
    }
    
    func test_trips_giveLoggedInUserIsFriendWithUser_shouldReturnFriendTrips() {
        let user = UserBuilder {
            $0.friends = [TestConstant.REGISTERED, TestConstant.A_USER]
            $0.trips = [TestConstant.ITALY, TestConstant.IRELAND]
        }.build()
        XCTAssertEqual(try? makeSUT(withTrips: user.trips).trips(by: user, loggedInUser: TestConstant.REGISTERED), [TestConstant.ITALY, TestConstant.IRELAND])
    }
    
    private func makeSUT(withTrips trips: [Trip] = []) -> TripService {
        let mockTripDAO = MockTripDAO(trips: trips)
        return TripService(tripDAO: mockTripDAO)
    }
}

private class MockTripDAO: TripDAO {
    private var trips: [Trip]
    
    init(trips: [Trip]) {
        self.trips = trips
        super.init()
    }
    
    override func findTrips(by user: User) throws -> [Trip] {
        return trips
    }
}
