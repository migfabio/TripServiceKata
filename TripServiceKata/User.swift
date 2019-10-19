//
//  User.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

public enum UserError: Error {
    case notLoggedIn
}

public class User: Equatable {
    
    private let id: UUID
    public private(set) var friends: [User]
    public private(set) var trips: [Trip]
    
    public init() {
        self.id = UUID()
        self.friends = []
        self.trips = []
    }
    
    public func addFriend(_ friend: User) {
        friends.append(friend)
    }
    
    public func addTrip(_ trip: Trip) {
        trips.append(trip)
    }
    
    public func friend(with user: User) -> Bool {
        return friends.contains(user)
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
