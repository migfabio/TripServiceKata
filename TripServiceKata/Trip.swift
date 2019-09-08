//
//  Trip.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

class Trip: Equatable {
    
    private let id = UUID()
    
    static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id == rhs.id
    }
}
