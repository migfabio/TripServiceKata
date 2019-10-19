//
//  UserTests.swift
//  TripServiceKataTests
//
//  Created by Fabio Mignogna on 19/10/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
@testable import TripServiceKata

class UserTests: XCTestCase {
    
    func test_friend_givenUserNotInFriendsList_shouldReturnFalse() {
        let sut = UserBuilder {
            $0.friends = [TestConstant.ALICE]
        }.build()
        let aUser = TestConstant.BOB
        XCTAssertFalse(sut.friend(with: aUser))
    }
    
    func test_friend_givenUserInFriendsList_shouldReturnTrue() {
        let sut = UserBuilder {
            $0.friends = [TestConstant.ALICE, TestConstant.BOB]
        }.build()
        let aUser = TestConstant.BOB
        XCTAssertTrue(sut.friend(with: aUser))
    }
}

class UserBuilder {
    
    var friends = [User]()
    var trips = [Trip]()
    
    typealias UserBuilderClosure = (UserBuilder) -> Void
    
    init(builderClosure: UserBuilderClosure) {
        builderClosure(self)
    }
    
    func build() -> User {
        let user = User()
        friends.forEach { user.addFriend($0) }
        trips.forEach { user.addTrip($0) }
        return user
    }
}
