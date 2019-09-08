//
//  TripDAO.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

class TripDAO {
    
    class func findTrips(by user: User) throws -> [Trip] {
        throw UnitTestError.dependantClassCalled(message: "TripDAO should not be invoked on an unit test")
    }
}
