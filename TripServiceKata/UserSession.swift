//
//  UserSession.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

class UserSession {
    
    static let instance = UserSession()
    
    private init() {}
    
    func loggedUser() throws -> User? {
        throw UnitTestError.dependantClassCalled(message: "UserSession should not be invoked on an unit test")
    }
}
