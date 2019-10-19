//
//  TripService.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

class TripService {
    
    private var tripDAO: TripDAO
    
    init(tripDAO: TripDAO) {
        self.tripDAO = tripDAO
    }
    
    func trips(by user: User, loggedInUser: User?) throws -> [Trip] {
        guard let loggedUser = loggedInUser else {
            throw UserError.notLoggedIn
        }
        
        guard user.friend(with: loggedUser), let trips = try? getTrips(by: user) else {
            return []
        }
        
        return trips
    }
    
    func getTrips(by user: User) throws -> [Trip] {
        return try tripDAO.findTrips(by: user)
    }
}
