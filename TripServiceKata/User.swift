//
//  User.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

enum UserError: Error {
    case notLoggedIn
}

class User: Equatable {
    
    private let id = UUID()
    private(set) var friends = [User]()
    private(set) var trips = [Trip]()
    
    func addFriend(_ friend: User) {
        friends.append(friend)
    }
    
    func addTrip(_ trip: Trip) {
        trips.append(trip)
    }
    
    func friend(with user: User) -> Bool {
        return false
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
