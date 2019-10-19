//
//  TripService.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

class TripService {
    
    class func trips(by user: User) throws -> [Trip] {
        var tripList = [Trip]()
        let loggedUser = try! getLoggedUser()
        if loggedUser != nil {
            if user.friend(with: loggedUser!) {
                tripList = try! getTrips(by: user)
            }
            return tripList
        } else {
            throw UserError.notLoggedIn
        }
    }
    
    class func getLoggedUser() throws -> User? {
        return try UserSession.instance.loggedUser()
    }
    
    class func getTrips(by user: User) throws -> [Trip] {
        return try TripDAO.findTrips(by: user)
    }
}
