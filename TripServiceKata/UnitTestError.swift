//
//  UnitTestError.swift
//  TripServiceKata
//
//  Created by Fabio Mignogna on 08/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

public enum UnitTestError: Error {
    case dependantClassCalled(message: String)
}
