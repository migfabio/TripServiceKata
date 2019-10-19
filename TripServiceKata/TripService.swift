//
//  TripService.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

class TripService {
    
    private var tripDAO: TripDAO?
    
    init(tripDAO: TripDAO? = nil) {
        self.tripDAO = tripDAO
    }
    
    func trips(by user: User, loggedInUser: User?) throws -> [Trip] {
        guard let loggedUser = loggedInUser else {
            throw UserError.notLoggedIn
        }
        
        return user.friend(with: loggedUser) ?
            (try? getTrips(by: user)) ?? [] :
            []
    }
    
    func getTrips(by user: User) throws -> [Trip] {
        return try (tripDAO?.findTrips(by: user) ?? [])
    }
}
