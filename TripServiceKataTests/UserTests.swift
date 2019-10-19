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
    
    func test_friend_giveUserNotInFriendsList_shouldReturnFalse() {
        let sut = UserBuilder {
            $0.friends = [TestConstant.ALICE]
        }.build()
        let aUser = TestConstant.BOB
        XCTAssertFalse(sut.friend(with: aUser))
    }
}
