//
//  TripService.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

class TripService {
    
    class func trips(by user: User) throws -> [Trip] {
        guard let loggedUser = try? getLoggedUser() else {
            throw UserError.notLoggedIn
        }
        
        return user.friend(with: loggedUser) ?
            (try? getTrips(by: user)) ?? [] :
            []
    }
    
    class func getLoggedUser() throws -> User? {
        return try UserSession.instance.loggedUser()
    }
    
    class func getTrips(by user: User) throws -> [Trip] {
        return try TripDAO.findTrips(by: user)
    }
}
