//
//  Trip.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

public class Trip: Equatable {
    
    private let id: UUID
    
    public init() {
        self.id = UUID()
    }
    
    public static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id == rhs.id
    }
}
