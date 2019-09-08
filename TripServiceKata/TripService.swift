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
        var isFriend = false
        if loggedUser != nil {
            for friend in user.friends {
                if friend == loggedUser! {
                    isFriend = true
                    break
                }
            }
            if isFriend {
                tripList = try! TripDAO.findTrips(by: user)
            }
            return tripList
        } else {
            throw UserError.notLoggedIn
        }
    }
    
    class func getLoggedUser() throws -> User? {
        return try UserSession.instance.loggedUser()
    }
}
